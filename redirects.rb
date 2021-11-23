# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect to the most recent version of Build Service are commented out because these are in docs-book-pcfservices

# r301 %r{latest/(.*)}, "/build-service/1-2/$1"
# r301 %r{/build-service/(?![\d-]+)(.*)}, "/build-service/1-2/$1"

# Redirect from docs.pivotal.io/build-service/1-2 to docs.vmware.com build service docs

r301  %r{/build-service/1-2/index.html}, "https://docs.vmware.com/en/Tanzu-Build-Service/1.2/vmware-tanzu-build-service-v12/GUID-docs-build-service-index.html"
r301  %r{/build-service/1-2/(.*)}, "https://docs.vmware.com/en/Tanzu-Build-Service/1.2/vmware-tanzu-build-service-v12/GUID-$1"

# Redirect from docs.pivotal.io/build-service/1-1 to docs.vmware.com build service docs

r301  %r{/build-service/1-1/index.html}, "https://docs.vmware.com/en/Tanzu-Build-Service/1.1/vmware-tanzu-build-service-v11/GUID-docs-build-service-index.html"
r301  %r{/build-service/1-1/(.*)}, "https://docs.vmware.com/en/Tanzu-Build-Service/1.1/vmware-tanzu-build-service-v11/GUID-$1"
