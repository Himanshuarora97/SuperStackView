Pod::Spec.new do |spec|

  spec.name         = "SuperStackView"
  spec.version      = "0.0.1"
  spec.summary      = "A feature rich version of UIStackView, with simple and powerful API."

  spec.description  = <<-DESC
  - Allows you to add dynamic spacing b/w views

    UIStackView doesn't allow to add the variable spacing with different views.

    UIStackView spacing property add spacing to all the views.

    iOS 11 added the support of dynamic spacing as stackView.setCustomSpacing(10.0, after: firstView) but it's not that flexible and only support line spacing b/w views.

- Allows you to set alignment (top, bottom and center) to separate views

    UIStackView alignment property applied to all the views, with SuperStackView you can set the alignment to any view.

- Built in separator view support
- Support all the properties of UIStackView
                   DESC

  spec.homepage     = "https://github.com/Himanshuarora97/SuperStackView"

  spec.license      = { :type => "MIT", :file => "LICENSE.md" }

  spec.author       = { "himanshuarora97" => "himanshuarora3097@gmail.com" }

  spec.ios.deployment_target = "10.0"

  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/Himanshuarora97/SuperStackView.git", :tag => "#{spec.version}" }

  spec.source_files  = "SuperStackView/**/*.{swift,h}"

end
