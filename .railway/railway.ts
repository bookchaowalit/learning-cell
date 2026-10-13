import { defineRailway, project, service } from "railway/iac";

// life-learning-api: the Learning cell. Variables stay unmanaged (secrets live in Railway only).
// learning-api sleeps when idle (Railway Serverless) and wakes on the next request.
// Every service runs in Singapore next to Neon (aws-ap-southeast-1) and empire-platform; the IaC does not
// carry the region, so after the first deploy: railway scale --service <svc> asia-southeast1-eqsg3a=1 us-east4-eqdc4a=0
export default defineRailway(() => {
  const api = service("learning-api", {
    healthcheck: "/health",
    healthcheckTimeout: 60,
    deploy: { sleepApplication: true },
  });

  return project("life-learning-api", {
    variables: { managed: false },
    resources: [api],
  });
});
