## Mealie Backup for Unraid

This script was created to run a daily backup of mealies SQLite database and store in s3 


## Installation

### AWS

You will need an s3 bucket, 

You will need IAM user with a policy like this to the s3 bucket

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::unraid-backup"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::unraid-backup/*"
        }
    ]
}
```

On Unraid the AWS CLI will need to be installed using the terminal

1. Use curl to download the AWS CLI v2 installer for Linux.

    ```
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    ```

2. Unzip the Installer

    ```
    unzip awscliv2.zip
    ```
3. Run the Installer

    ``` 
    sudo ./aws/install
    ```
    This command installs the AWS CLI to /usr/local/bin/aws by default.


4. Verify the Installation


    ```
    aws --version
    ```

5. Configure AWS profile
    ```
    aws configure
    ```


### install User Scripts
1. Install User Scripts in Unraid apps
2. Open User Scripts in settings User Utilities
3. Add new script
4. Edit script copy and past code from run.sh
5. Create API key in mealie /user/profile/api-tokens
6. Copy and paste Environment variables into script
7. In Docker settings enable Host access to custom networks: 
8. Run, your s3 bucket should now have the latest backup!