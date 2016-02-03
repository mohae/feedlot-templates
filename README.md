# rancher-templates
Rancher templates are used by [Rancher](https://github.com/mohae/rancher) to generate [Packer](https://packer.io) templates. 

This repository contains some Rancher templates, and their source files, which are used by Packer, that may be useful in generating Packer templates.  They also serve as additional examples of how Rancher templates can be defined to create Packer templates.  The Packer templates that these Rancher templates generate can be found at https://github.com/mohae/packer-templates.

## Usage
Clone the repo:

    git clone https://github.com/rancher-templates

Configure Rancher to use the configuration files and source files.

For details about Rancher and using Rancher refer to https://github.com/mohae/rancher.

## Configure Rancher:
Rancher can be configured to use the configuration files and Packer sources three ways: environment variables, runtime flags, and the Rancher configuration file.

### Rancher Configuration File
Rancher can use either `rancher.toml` or `rancher.cjsn` to override Rancher's defaults. If the `rancher.toml` file is used, an additional environment variable must be set.

Within the application configuration file, set the `conf_dir` to the path to your `rancher-templates\conf` directory.

### Environment Variable
Rancher will check to see if any environment variables are set. If so, they will override both the associated application default and the settings within the Rancher configuration file, if it exists. 

If you wish to use an environment variable to set the location which Rancher should search for the `rancher-templates/conf` directory, set the `RANCHER_CONF_DIR` environment variable to that location.

### Runtime Flag
If the `conf_dir` flag is passed to Rancher, the `conf_dir` flag's setting will be used. This will override the application default value, the Rancher configuration file value, and the Environment Variable value, if they exist.

## Packer Source files
All files referenced in the build templates are in the `packer_sources` directory.  Rancher uses the `source_dir` setting, which is set in the `defaults` file, but can also be set per build template, to locate the source directory.  Rancher uses the `source_dir_is_relative` setting, which is a bool, in conjuction with the `source_dir` setting to determine the actual location of the source directory.  The `source_dir_is_relative` setting is set to `true`, which means it is relative to the location of the configuration file containing the setting.

In this case, the location is `rancher-templates/conf` and the `source_dir` is `../packer_sources`, which means Rancher will look for the Packer source files in the `rancher-templates/packer_sources/` directory.
    
## TOML configs
The TOML configuration files are no longer being maintaines as of 2015-10-10.  Rancher's default format for configuration files is now JSON, or CJSON (commented JSON).  The TOML configurations have been moved to the `rancher-templates/conf/toml` directory.  They are still usable and will build Packer templates.  To use these files set the `RANCHER_CONF_DIR` to `rancher-templates/conf/toml`.

Any updates made to the `cjsn`, CJSON, configs in the `rancher-templates/conf` directory will not be reflected in the TOML configs.
