# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect from docs.pivotal.io/build-service/1-1 to docs.vmware.com build service docs

r301  %r{/build-service/1-1/index.html}, "https://docs.vmware.com/en/Tanzu-Build-Service/1.1/vmware-tanzu-build-service-v11/GUID-docs-build-service-index.html"
r301  %r{/build-service/1-1/}, "https://docs.vmware.com/en/Tanzu-Build-Service/1.1/vmware-tanzu-build-service-v11/GUID-docs-build-service-index.html"
r301  %r{/build-service/1-1}, "https://docs.vmware.com/en/Tanzu-Build-Service/1.1/vmware-tanzu-build-service-v11/GUID-docs-build-service-index.html"
r301  %r{/build-service/1-1/(.*)}, "https://docs.vmware.com/en/Tanzu-Build-Service/1.1/vmware-tanzu-build-service-v11/GUID-$1"
