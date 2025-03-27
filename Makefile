# Makefile

# Define a target to run the release creation script
release:
	@echo "Creating GitHub release..."
	./create-release.sh
