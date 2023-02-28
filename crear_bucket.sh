#!/bin/bash

# Indicar en el parámetro del script el nombre del bucket

# Crear bucket
aws s3 mb "s3://${1}"

# Activar sitio web estático
aws s3 website "s3://${1}" --index index.html

# Política de acceso público a objetos
aws s3api put-bucket-policy --bucket $1 --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::'$1'/*"
            ]
        }
    ]
}'
