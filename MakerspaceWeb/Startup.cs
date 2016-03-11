using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MakerspaceWeb.Startup))]
namespace MakerspaceWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
