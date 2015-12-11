# rancher-build-templates
Rancher build templates are used by [Rancher](https://github.com/rancher) to generated [Packer](https://packer.io) templates. 

## Usage
Clone the repo:

    git clone https://github.com/rancher-build-templates

Configure Rancher to use the configuration files and source files.

For details about Rancher and using Rancher refer to https://github.com/mohae/rancher.

## Configure Rancher:
Rancher can be configured to use the configuration files and Packer sources three ways: environment variables, runtime flags, and the Rancher configuration file.

### Rancher Configuration File
Rancher can use either `rancher.toml` or `rancher.cjsn` to override Rancher's defaults. If the `rancher.toml` file is used, an additional environment variable must be set.

Within the application configuration file, set the `conf_dir` to the path to your `rancher-build-templates\conf` directory.

### Environment Variable
Rancher will check to see if any environment variables are set. If so, they will override both the associated application default and the settings within the Rancher configuration file, if it exists. 

If you wish to use an environment variable to set the location which Rancher should search for the `rancher-build-templates/conf` directory, set the `RANCHER_CONF_DIR` environment variable to that location.

### Runtime Flag
If the `conf_dir` flag is passed to Rancher, the `conf_dir` flag's setting will be used. This will override the application default value, the Rancher configuration file value, and the Environment Variable value, if they exist.

## Configure the `source_dir`
Rancher build configuration files have a `source_dir` setting that determines where Rancher finds the Packer source files for a given build. The `default.cjsn` file currently points to `rancher-build-templates/packer_sources`. It may be necessary to update this path so that Rancher can locate this file. The current setting assumes that the `rancher-build-template` will be in Rancher's working directory.

Each Rancher build template can override this setting, but none within this repo do.
    
## TOML configs
The TOML configuration files are no longer being maintaines as of 2015-10-10.  Rancher's default format for configuration files is now JSON, or CJSON (commented JSON).  The TOML configurations have been moved to the `rancher-build-templates/conf/toml` directory.  They are still usable and will build Packer templates.  To use these files set the `RANCHER_CONF_DIR` to `rancher-build-templates/conf/toml`.

Any updates made to the `cjsn`, CJSON, configs in the `rancher-build-templates/conf` directory will not be relected in the TOML configs.