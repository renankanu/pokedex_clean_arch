.PHONY: run_cov

run_cov: 
	@echo "๐งช Running the test coverage"
	@flutter test --coverage || (echo "โโ Error while running tests โโ"; exit 1)
	@echo "โ Done"

run_gen_cov:
	@echo "๐ช Running the genhtml coverage"
	@genhtml coverage/lcov.info -o coverage/html
	@open coverage/html/index.html
	@echo "โ Done"
	