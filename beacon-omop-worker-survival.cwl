cwlVersion: v1.0
class: CommandLineTool
id: beacon-omop-worker-survival
label: beacon-omop-worker-survival

hints:
    DockerRequirement:
        dockerPull: hutchstack/beacon-omop-worker:latest

baseCommand: [beacon-omop-worker]
arguments: ["survival"]

inputs:
    snomed_code:
        type: string?
        inputBinding:
            position: 2
            prefix: -s
    output_file:
        type: string?
        inputBinding:
            position: 3
            prefix: -o

outputs:
    output_file:
        type: File
        outputBinding:
            glob: "output.png"