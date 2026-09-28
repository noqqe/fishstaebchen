# Once a day, i need to login into aws sso
status is-interactive; or return

function aws-sso-ensure --description 'Log in to AWS SSO session if token expired'
    set -l session YouGov
    # AWS CLI caches sso-session tokens as sha1(<session name>).json
    set -l hash (printf %s $session | sha1sum 2>/dev/null | string split -f1 ' ')
    test -z "$hash"; and set hash (printf %s $session | shasum | string split -f1 ' ')
    set -l cache ~/.aws/sso/cache/$hash.json

    if test -f $cache
        set -l expires (string match -rg '"expiresAt":\s*"([^"]+)"' < $cache)
        set -l exp_num (string replace -ra '\D' '' -- $expires | string sub -l 14)
        set -l now_num (date -u +%Y%m%d%H%M%S)
        if test -n "$exp_num"; and test $exp_num -gt $now_num
            return 0
        end
    end

    echo "AWS SSO session '$session' expired, logging in…"
    aws sso login --sso-session $session
end

aws-sso-ensure
