local params = std.extVar('__ksonnet/params');
local globals = import 'globals.libsonnet';
local envParams = params + {
  components+: {
    "kubeflow-core"+: {
      cloud: 'gke',
      tfAmbassadorServiceType: 'LoadBalancer',
    },
    "tfjob-v1alpha2"+: {
      image: 'gcr.io/kubeflow-examples/tf-job-issue-summarization:v20180629-v0.1-2-g98ed4b4-dirty-182929',
      output_model_gcs_bucket: 'kubeflow-qwiklabs-gcp-02-31ab4cdd7350',
    },
  },
};

{
  components: {
    [x]: envParams.components[x] + globals
    for x in std.objectFields(envParams.components)
  },
}