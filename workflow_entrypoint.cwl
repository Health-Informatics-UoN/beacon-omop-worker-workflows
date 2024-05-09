cwlVersion: v1.0
class: Workflow
id: beacon_workflow
label: beacon-workflow

inputs:
    filters:
        type: string?
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
        outputSource: beacon-oneshot/output_file

steps:
    beacon-oneshot:
        run: ./beacon-omop-worker.cwl
        in:
            filters: filters
            db_host: db_host
            db_name: db_name
            db_user: db_user
            db_password: db_password
            
        out: [output_file]
