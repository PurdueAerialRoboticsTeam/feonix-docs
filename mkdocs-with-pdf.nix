{ buildPythonPackage
, fetchPypi
, isPy3k
, lib
, beautifulsoup4
, libsass
, mkdocs
, qrcode
, weasyprint
}:

let
  pname = "mkdocs-with-pdf";
  version = "0.9.3";
in

buildPythonPackage {
  inherit pname version;

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-vaM3XXBA0biHHaF8bXHqc2vcpsZpYI8o7WJ3EDHS4MY=";
  };

  propagatedBuildInputs = [
    beautifulsoup4
    libsass
    mkdocs
    qrcode
    weasyprint
  ];

  doCheck = false; # Needs deps qrcode and barcode. barcode isn't packaged.

  pythonImportsCheck = [ "mkdocs_with_pdf" ];

  meta = with lib; {
    description = "This plugin will generate a single PDF file from your MkDocs repository.";
    homepage = "https://github.com/orzih/mkdocs-with-pdf";
    license = licenses.mit;
    maintainers = with maintainers; [ tfc ];
  };
}
