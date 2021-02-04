# CODE SERVER

 Fully dockerized browser-based Visual Studio Code IDE inside a docker container. Includes terminal, scheduler and filebrowser.

 To launch Code Server

 ```
 docker run --name codeserver -d -p 8020-8035:8020-8035 vinothmohan/code-server
 ```

 To Open Code server in browser
  
 http://<localhost or public-ip>:8025

 To Open Workspace 

http://<localhost or public-ip>:8020

## Other included Tools with UI

* **Terminal** - secure browser-based terminal.
* **FileBrowser** - manage files and folders inside the workspace, and exchange data between local environment and the workspace
* **Cronicle** - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
* **Static File Server** - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
* **Ungit** - rings user friendliness to git without sacrificing the versatility of it.
* **MkDocs** - maintain documentation for your workspace or project with only markdown.
* **Process Monitor** - Monitor running process and resource utilization.


