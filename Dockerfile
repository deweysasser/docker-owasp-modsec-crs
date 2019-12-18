FROM owasp/modsecurity-crs

ENV ENFORCING=DetectionOnly

ADD docker-entrypoint-override.sh /docker-entrypoint-override.sh
ENTRYPOINT ["/docker-entrypoint-override.sh"]
CMD ["apachectl", "-D", "FOREGROUND"]
