require 'google/apis/iam_v1'

Iam = Google::Apis::IamV1 # Alias the module
service = Iam::IamService.new

variable1 = service.get_project_service_account("projects/#{gcp_project_id}/serviceAccounts/#{sa_name}").to_json
variable2 = `gcloud logging read "logName : projects/#{gcp_project_id}/logs/cloudaudit.googleapis.com" --project=#{gcp_project_id} --freshness=30d --format json 2>&1`
variable3 = service.http(:get, "https://monitoring.googleapis.com/v3/projects/#{gcp_project_id}/timeSeries?filter=metric.-----")
