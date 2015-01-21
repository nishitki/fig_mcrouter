FROM centos7-systemd 
MAINTAINER "nishiki" <mnishikizawa@gmail.com>
RUN yum -y update && yum clean all
RUN yum -y install openssh-server passwd sudo libevent boost-thread boost-system boost-regex boost-filesystem \
boost-python boost-context numactl-libs snappy ;yum clean all

RUN rpm -ivh http://172.17.32.218/gflags-2.1.1-6.el7.centos.x86_64.rpm
RUN rpm -ivh http://172.17.32.218/glog-0.3.3-8.el7.centos.x86_64.rpm 
RUN rpm -ivh http://172.17.32.218/ragel-6.9-1.el7.centos.x86_64.rpm
RUN rpm -ivh http://172.17.32.218/double-conversion-2.0.1-3.el7.centos.x86_64.rpm
RUN rpm -ivh http://172.17.32.218/folly-11-4.el7.centos.x86_64.rpm 
RUN rpm -ivh http://172.17.32.218/folly-double-conversion-2.0.1-4.el7.centos.x86_64.rpm
RUN rpm -ivh http://172.17.32.218/fbthrift-11.0-1.el7.centos.x86_64.rpm
RUN rpm -ivh http://172.17.32.218/mcrouter-1.0-1.el7.centos.x86_64.rpm

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

RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/mcrouter-x86.conf
RUN ldconfig

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN systemctl enable sshd.service

EXPOSE 22 11211
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
