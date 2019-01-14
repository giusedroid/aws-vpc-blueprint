ifeq ($(CIRCLE_BRANCH), master)
	DEPLOY_ENV=stable
else
	DEPLOY_ENV=$(CIRCLE_BRANCH)
endif

vpc:
	echo "Deploying to $(DEPLOY_ENV)"
	aws cloudformation deploy --template-file cloudformation/00-vpc.yml --stack-name $(DEPLOY_ENV)_VPC --capabilities CAPABILITY_NAMED_IAM --parameter-overrides Environment=$(DEPLOY_ENV) --no-fail-on-empty-changeset