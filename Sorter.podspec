Pod::Spec.new do |s|
  s.name = 'Sorter'
  s.version = '0.1.0'
  s.summary = 'Sorter with multiple conditions in Swift, such as NSSortDescriptor.'
  s.homepage = 'https://github.com/naoto0n2/Sorter'
  s.author = {
    'Naoto Onagi' => 'naoto.0n2@gmail.com'
  }
  s.social_media_url = 'https://twitter.com/naoto0n2'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sorter/Classes/**/*'
  s.source = {
    :git => 'https://github.com/naoto0n2/Sorter.git',
    :tag => s.version.to_s
  }

  s.license = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
end
