## How-to use SMB client

```bash
ssh host
smbclient //<ip>/<share> -U username

# Opens the smb client. Inside it, you can retrieve a file
> cd <file-directory>
> get <file>
> quit
# Then edit the file and repeat
smbclient //<ip>/<share> -U username
> put <file>
> quit
```

