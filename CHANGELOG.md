# Changelog

## [2.0.1](https://github.com/gersonrs/modern-gitops-stack-module-trino/compare/v2.0.0...v2.0.1) (2026-11-20)


### 🔥 Bug Fixes

* use kubernetes_service_v1 data source ([#8](https://github.com/gersonrs/modern-gitops-stack-module-trino/issues/8)) ([34521f8](https://github.com/gersonrs/modern-gitops-stack-module-trino/commit/34521f842d11bf6fddafa8120f14384945be48ca))

## [2.0.0](https://github.com/gersonrs/modern-gitops-stack-module-trino/compare/v1.1.1...v2.0.0) (2026-11-20)


### ⚠ BREAKING CHANGES

* provider major bumps and a stricter Terraform baseline; consumers must run `terraform init -upgrade`.

### 🚀 New Features

* add namespace_labels variable to all modules ([d84431a](https://github.com/gersonrs/modern-gitops-stack-module-trino/commit/d84431a4d6ea9d23c396c06043b785db9e19f06d))
* upgrade charts, providers and Terraform baseline ([#5](https://github.com/gersonrs/modern-gitops-stack-module-trino/issues/5)) ([5b27d9d](https://github.com/gersonrs/modern-gitops-stack-module-trino/commit/5b27d9d41325e9358977b6552f6d0b629e3839f2))


### 📦 CI Improvements

* run release-please with GITHUB_TOKEN ([#6](https://github.com/gersonrs/modern-gitops-stack-module-trino/issues/6)) ([40367f4](https://github.com/gersonrs/modern-gitops-stack-module-trino/commit/40367f455314c15fcbce5421223153526ca055f5))

## [1.1.1](https://github.com/GersonRS/modern-gitops-stack-module-trino/compare/v1.1.0...v1.1.1) (2025-02-08)


### 📚 Documentation

* **terraform-docs:** generate docs and write to README.adoc ([0885ad2](https://github.com/GersonRS/modern-gitops-stack-module-trino/commit/0885ad2d4ae4f3c1d83c3b909f4f23afa998b69b))


### ⌨️ Code Refactoring

* adjust workflows ([28ba287](https://github.com/GersonRS/modern-gitops-stack-module-trino/commit/28ba287951379c5c04facdee2e18672ff04804bd))

## [1.1.0](https://github.com/GersonRS/modern-gitops-stack-module-trino/compare/v1.0.0...v1.1.0) (2024-08-19)


### 🚀 New Features

* adjust repo ([945240c](https://github.com/GersonRS/modern-gitops-stack-module-trino/commit/945240cc4102a55a82e3116abbd63138730716d0))


### 📚 Documentation

* **terraform-docs:** generate docs and write to README.adoc ([6476079](https://github.com/GersonRS/modern-gitops-stack-module-trino/commit/6476079fa694f800d3ff2097f398312d32c4481d))
