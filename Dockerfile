FROM filebrowser/filebrowser
RUN /filebrowser config init
RUN /filebrowser config set --auth.method=noauth --branding.disableExternal=true
RUN /filebrowser users add admin admin \
    --lockPassword=true \
    --perm.admin=false \
    --perm.delete=false \
    --perm.create=false \
    --perm.execute=false \
    --perm.rename=false \
    --perm.modify=false \
    --viewMode=mosaic \
    --sorting.by=modified \
    --sorting.asc=false