# BHL ASpace Handle Verifier
This plugin extends ArchivesSpace's File Version model by adding a step to identify File URIs that are associated with the Bentley's [DSpace repository](https://deepblue.lib.umich.edu/handle/2027.42/65133) but which do not begin with `https://hdl.handle.net`. The primary use case for this check is to ensure that Digital Objects created by Archivematica have the full Handle.Net link  and to automatically modify direct links to DSpace (i.e., File URIs that begin with `https://deepblue.lib.umich.edu/handle/`) to use the Handle.Net proxy URL. 

## Directory Structure
    backend\
        model\
            mixins\
                bhl_handle_verifier.rb
            file_version_ext.rb

## How it Works
The mixin at `backend/model/mixins/bhl_handle_verifier.rb` adds a `BHLHandleVerifier` module with a `before_save` method which uses a regular expression to identify File URIs that contain `2027.42` (which all BHL handles contain) but which do not begin with `https://hdl.handle.net`. The mixin then prepends matching File URIs with the Handle.Net proxy URL.

The mixin is added to the ArchivesSpace File Version model by `backend/model/file_version_ext.rb`.