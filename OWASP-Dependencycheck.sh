docker pull owasp/dependency-check

docker run 
    owasp/dependency-check \
    --scan / package.json \
    --format "ALL" \
    --project "My OWASP Dependency Check Project" \
    --out /report