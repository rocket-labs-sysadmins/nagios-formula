{% from "nagios/map.jinja" import nrpe with context %}

{%- if 'RedHat' in grains['os_family'] %}
nrpe-plugin-package:
  pkg.installed:
    - name: {{ nrpe.plugin }}
{%- endif %}

{% if 'nagios/nrpe/files/plugins' in salt['cp.list_master_dirs']() %}
{{ nrpe.plugin_dir }}:
  file.recurse:
    - source: salt://nagios/nrpe/files/plugins/
    - clean: False
    - file_mode: 0755
{% endif %}
