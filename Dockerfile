FROM yottadb/yottadb-base:r1.32
COPY entrypoint.sh /entrypoint.sh
RUN mkdir /githubaction
COPY . /githubaction/
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

