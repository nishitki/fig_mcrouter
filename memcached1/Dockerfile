FROM centos7-systemd 
MAINTAINER "nishiki" <mnishikizawa@gmail.com>
RUN yum -y update && yum clean all
RUN yum -y install openssh-server passwd sudo ; yum clean all

Run yum -y install memcached

RUN useradd jenkins 
#RUN echo  -e "hogehoge\nhogehoge" | (passwd --stdin jenkins)
RUN mkdir -p /home/jenkins/.ssh
RUN chown jenkins /home/jenkins/.ssh
RUN chmod 700 /home/jenkins/.ssh
ADD ./id_rsa.pub /home/jenkins/.ssh/authorized_keys
RUN chown jenkins /home/jenkins/.ssh/authorized_keys
RUN chmod 600 /home/jenkins/.ssh/authorized_keys
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL " > /etc/sudoers.d/jenkins

RUN mkdir /var/run/sshd
#RUN rm -f /var/run/nologin

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN systemctl enable sshd.service
#RUN systemctl enable memcached.service

EXPOSE 22 11211
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
