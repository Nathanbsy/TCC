using TCM.Libraries.LoginUsuarios;
using TCM.Models;
using TCM.Repositorio;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

// Adicionando autentica��o com cookies
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Home/Login"; // Caminho para a p�gina de login
    });

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddHttpContextAccessor();

// Adicionando a interface de login
builder.Services.AddScoped<IProdutoRepositorio, ProdutoRepositorio>();
builder.Services.AddScoped<ILoginRepositorio, LoginRepositorio>();

builder.Services.AddScoped<Usuario>();

// Adicionado para manipular a Sess�o
builder.Services.AddHttpContextAccessor();

// Adicionar a Interface como um servi�o 
// Adicionar servi�os 
builder.Services.AddScoped<ILoginRepositorio, LoginRepositorio>();
builder.Services.AddScoped<TCM.Libraries.Sessao.Sessao>();

builder.Services.AddScoped<LoginUsuarios>();

var app = builder.Build();

app.UseAuthentication(); // Ativa a autentica��o
app.UseAuthorization();  // Ativa a autoriza��o

// Configure o pipeline de requisi��es HTTP
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

// Ativar autentica��o e autoriza��o
app.UseAuthentication(); // Adicione esta linha para que a autentica��o com cookies funcione
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
