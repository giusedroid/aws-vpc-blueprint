configure:
	DEPLOY_ENV=$(CIRCLE_BRANCH)
	if [ "$CIRCLE_BRANCH" == "master" ]; then
		DEPLOY_ENV=stable
	fi
vpc:
	echo "Deploying to ${DEPLOY_ENV}"
	aws cloudformation deploy --template-file cloudformation/00-vpc.yml --stack-name $(DEPLOY_ENV)_VPC --capabilities CAPABILITY_NAMED_IAM --parameter-overrides Environment=$(DEPLOY_ENV) --no-fail-on-empty-changeset

