 ## jupyterhub_dockerspawner_ldap
 
 Fully configurated jupyterhub LDAP &amp; dockerspawner dockerfiles
 
 For simply creating and running the fully configurated server `run.sh`
 
 ⬇️ Configuration explanation right below  ⬇️
 
 ### Hub
 
The hub is mutual for all users. the users are configured via LDAP server (initialy configured to `ldap.forumsys.com` see [blog](https://www.forumsys.com/tutorials/integration-how-to/ldap/online-ldap-test-server/)). for other LDAP server rewrite `./hub/jupyterhub_config.py`

When user is authenticated successfully docker container named `jupyter-{username}` is created from image **jupyterhub_custom_notebook**

### Notebook

For customizing the user's python environment we will create custom notebook image with all of python installation inside. the image is based on `jupyter/minimal-notebook` image and installing over it some python packages. new image tagged **jupyterhub_custom_notebook**.

See and reconfigure file: `./notebook/Dockerfile`
