namespace :docker do
  
  LOCAL_IMAGE_NAME = "local/bluejay-spark-executor"
  TAG_NAME = "bluejay-spark-executor"
  ARTIFACTORY_REPO_DEV = "docker2-adoberesearch-dev-local.dr.corp.adobe.com"
  ARTIFACTORY_REPO_REL = "docker2-adoberesearch-release-local.dr.corp.adobe.com"
  ARTIFACTORY_REPO_AWS_DEV = "docker2-adoberesearch-dev-local.dr-uw2.adobeitc.com"
  ARTIFACTORY_REPO_TECHOPS_DEV = "docker2-mccp-local.dr-uw2.adobeitc.com/repositories"
  MARATHON_MASTER_HOST = "camdenyards.corp.adobe.com"
  MARATHON_MASTER_PORT = "8082"

  desc "Remove orphaned docker images and containers"
  task :clean do
    %x(docker rm `docker ps -aq --no-trunc --filter 'status=exited'`)
    %x(docker rmi `docker images --filter 'dangling=true' -q --no-trunc`)
  end

  namespace :build do

    desc "Build Docker image (Prod)"
    task :prod do
      sh %(docker build -t #{LOCAL_IMAGE_NAME} .)
    end
  
  end

  namespace :push do

    task :prod do
      image_tag = %x(docker images | grep #{LOCAL_IMAGE_NAME} | grep latest | awk '{printf "%s", $3}')
      puts "image_tag:#{image_tag}"
      push_tag = "#{ARTIFACTORY_REPO_REL}/#{TAG_NAME}"
      puts "push_tag:#{push_tag}"
      sh %(docker tag -f #{image_tag} #{push_tag})
      sh %(docker push #{push_tag})
    end

  end

end  
