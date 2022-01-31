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