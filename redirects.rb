# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

r301 %r{/build-service/(?![\d-]+)(.*)}, "/platform/build-service/$1"

# Redirect to the most recent version of Build Service
r301 %r{/platform/build-service/(?![\d-]+)(.*)}, "/platform/build-service/0-0-4/$1"

