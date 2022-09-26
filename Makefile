.PHONY: run_cov

run_cov: 
	@echo "🧪 Running the test coverage"
	@flutter test --coverage || (echo "▓▓ Error while running tests ▓▓"; exit 1)
	@echo "✅ Done"

run_gen_cov:
	@echo "🪓 Running the genhtml coverage"
	@genhtml coverage/lcov.info -o coverage/html
	@open coverage/html/index.html
	@echo "✅ Done"
	