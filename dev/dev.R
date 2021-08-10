# dependency package
usethis::use_package("stats")
usethis::use_package("utils")
usethis::use_package("DESeq2")
usethis::use_package("BiocGenerics")
usethis::use_package("ggplot2")
usethis::use_package("ggpubr")
usethis::use_package("tibble")

usethis::use_mit_license("Yonghe Xia")
usethis::use_readme_md()
usethis::use_code_of_conduct()

usethis::use_vignette("a_example_workflow")

## a website
# Run once to configure your package to use pkgdown
usethis::use_pkgdown()
pkgdown::build_site()

## add git
usethis::use_git()
usethis::use_github()

# CI
usethis::use_github_action_check_standard()

# CRAN
# 拼写检查
devtools::spell_check()
# 常规的本地测试
devtools::check()
# rhub 的全平台测试
rhub::check_for_cran()
# 仅仅Windows平台测试
devtools::check_win_devel()
# rhub 仅仅Windows平台测试
rhub::check_for_cran(
  platform="windows-x86_64-devel",
  env_vars=c(R_COMPILE_AND_INSTALL_PACKAGES = "always")
)
# 检查
devtools::release()
