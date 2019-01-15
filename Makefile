ifeq ($(CIRCLE_BRANCH), master)
	DEPLOY_ENV=stable
else
	DEPLOY_ENV=unstable
endif

vpc:
	echo "Deploying to $(DEPLOY_ENV)"
	aws cloudformation deploy --template-file cloudformation/00-vpc.yml --stack-name $(DEPLOY_ENV)-VPC --capabilities CAPABILITY_NAMED_IAM --parameter-overrides Environment=$(DEPLOY_ENV) --no-fail-on-empty-changeset
local:
	echo "Deploying from my machine"
	aws cloudformation deploy --template-file cloudformation/00-vpc.yml --stack-name local-VPC --capabilities CAPABILITY_NAMED_IAM --parameter-overrides Environment=local --no-fail-on-empty-changeset
