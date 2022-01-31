FROM filebrowser/filebrowser
RUN /filebrowser config init
RUN /filebrowser config set --auth.method=noauth
RUN /filebrowser users add admin admin \
    --lockPassword=true \
    --perm.admin=false \
    --perm.delete=false \
    --perm.create=false \
    --perm.execute=false \
    --perm.rename=false \
    --perm.modify=false
#COPY fb_noauth.db /database.db
#RUN /filebrowser config set --branding.name 'CETICam Data' 
#RUN /filebrowser config set --perm.admin=false --perm.create=false --perm.delete=false --perm.execute=false --perm.modify=false --perm.rename=false
#
# The only way I could get Filebrowser to work in noauth mode:
#  1 - add ENTRYPOINT ["tail", "-f", "/dev/null"] to keep filebrowser from starting
#  2 - open a shell to the container
#  3 - run /filebrowser from the command line
#  4 - Open a browser and login as admin/admin
#  5 - terminate filebrowser
#  6 - run /filebrowser config set --auth.method noauth
#  7 - run /filebrowser from the command line
#  8 - Open a browser and verify no login
#  9 - run cp /database.db to /srv/fb_noauth.db
# 10 - add  COPY fb_noauth.db /database.db to docker file
# 11 - comment out the ENTRYPOINT entry
#
#ENTRYPOINT ["tail", "-f", "/dev/null"]