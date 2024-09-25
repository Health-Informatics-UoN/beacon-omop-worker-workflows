cwlVersion: v1.0
class: Workflow
id: beacon_workflow
label: beacon-workflow

inputs:
    filters:
        type: string?
    vocabulary:
        type: string
    strata:
        type: string?
    output_name:
        type: string

outputs:
    output_file:
        type: File
        outputSource: beacon-oneshot/output_file
    survival_output_file:
        type: File
        outputSource: beacon-survival/output_file

steps:
    beacon-oneshot:
        run: ./beacon-omop-worker.cwl
        in:
            filters: filters
        out: [output_file]

    beacon-survival:
        run: ./beacon-omop-worker-survival.cwl
        in:
            vocabulary: vocabulary
            strata: strata
            output_name: output_name
        out: [output_file]