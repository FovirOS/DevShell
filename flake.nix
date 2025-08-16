{
  description = "DevShell for FOS.";

  outputs = {self}: {
    templates = {
      default = {
        path = ./default;
        description = "Default DevShell Template";
      };
      nodejs = {
        path = ./nodejs;
        description = "Node.js DevShell Template";
      };
      frontend = {
        path = ./frontend;
        description = "Front End Template";
      };
      react-vite = {
        path = ./react-vite;
        description = "React + Vite";
      };
      typescript = {
        path = ./typescript;
        description = "TypeScript";
      };
    };
  };
}
