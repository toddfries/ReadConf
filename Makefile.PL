use ExtUtils::MakeMaker;
WriteMakefile
(
  'NAME' => 'ReadConf',
  'VERSION_FROM' => 'lib/ReadConf.pm',
  'PREREQ_PM' => {
                   'Moose' => '1.15',
                   'MooseX::Params::Validate' => '0.14',
                 },
  'INSTALLDIRS' => 'site',
  'EXE_FILES' => [],
  'PL_FILES' => {}
)
;
