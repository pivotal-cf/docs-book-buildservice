# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect to the most recent version of om
r301 %r{/pivotal/buildservice/(?![\d-]+)(.*)}, "/pivotal/buildservice/2-7/$1"
