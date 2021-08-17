/**
 * Service to read secrets from filesystem
 */
component singleton="true" {

    /**
     * Get a docker secret
     */    
    public string function getSecret( required string secretName ) {
        var filePath = "/run/secrets/" & arguments.secretName;

        return fileRead( filePath ).trim();
    }
}