cwlVersion: v1.0
class: CommandLineTool
id: beacon-oneshot
label: beacon-oneshot

hints:
    DockerRequirement:
        dockerPull: hutchstack/beacon-omop-worker:latest
requirements:
    EnvVarRequirement:
        envDef:
            DATASOURCE_DB_HOST: $(inputs.db_host)
            DATASOURCE_DB_DATABASE: $(inputs.db_name)
            DATASOURCE_DB_USERNAME: $(inputs.db_user)
            DATASOURCE_DB_PASSWORD: $(inputs.db_password)

baseCommand: [beacon-omop-worker]
arguments: ["individuals"]
inputs:
    filters:
        type: string?
        inputBinding:
            position: 2
            prefix: -f
    db_host:
      type: string
    db_name:
      type: string
    db_user:
      type: string
    db_password:
      type: string

outputs:
    output_file:
        type: File
        outputBinding:
            glob: "output.json"
