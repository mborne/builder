# mborne/builder

[DEV] Vagrant helper to create VM to build multi-arch docker images.

## Features

* Build docker image for multiple architectures with buildx and qemu
* Use builder as jenkins node :

```bash
# given builder-1 is already registred :
vagrant ssh builder-1 -c "sudo JENKINS_SECRET=****** /vagrant/bin/jenkins-agent-install.sh"
```

* Use builder as gitlab runner :

```bash
vagrant ssh builder-1 -c "sudo /vagrant/bin/gitlab-runner-install.sh"
vagrant ssh builder-1 -c "sudo GITLAB_REGISTRATION_TOKEN=****** /vagrant/bin/gitlab-runner-register.sh"
```

## Ressources

* [medium.com - @artur.klauser - Building Multi-Architecture Docker Images With Buildx](https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408)
* See [mborne/docker-multiarch](https://github.com/mborne/docker-multiarch#readme) for an example.

## License

[MIT](LICENSE)
