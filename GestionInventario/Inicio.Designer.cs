namespace GestionInventario
{
    partial class Inicio
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.menu = new System.Windows.Forms.MenuStrip();
            this.menuusuario = new FontAwesome.Sharp.IconMenuItem();
            this.menumantenedor = new FontAwesome.Sharp.IconMenuItem();
            this.menuventas = new FontAwesome.Sharp.IconMenuItem();
            this.menucompras = new FontAwesome.Sharp.IconMenuItem();
            this.menuclientes = new FontAwesome.Sharp.IconMenuItem();
            this.menuproveedores = new FontAwesome.Sharp.IconMenuItem();
            this.menureportes = new FontAwesome.Sharp.IconMenuItem();
            this.menuacercade = new FontAwesome.Sharp.IconMenuItem();
            this.menuTitulo = new System.Windows.Forms.MenuStrip();
            this.tituloSistema = new System.Windows.Forms.Label();
            this.contenedor = new System.Windows.Forms.Panel();
            this.menu.SuspendLayout();
            this.SuspendLayout();
            // 
            // menu
            // 
            this.menu.AutoSize = false;
            this.menu.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menu.Dock = System.Windows.Forms.DockStyle.Left;
            this.menu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuusuario,
            this.menumantenedor,
            this.menuventas,
            this.menucompras,
            this.menuclientes,
            this.menureportes,
            this.menuproveedores,
            this.menuacercade});
            this.menu.Location = new System.Drawing.Point(0, 49);
            this.menu.Name = "menu";
            this.menu.Size = new System.Drawing.Size(139, 498);
            this.menu.TabIndex = 0;
            this.menu.Text = "menu";
            this.menu.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.menu_ItemClicked);
            // 
            // menuusuario
            // 
            this.menuusuario.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menuusuario.ForeColor = System.Drawing.Color.Black;
            this.menuusuario.IconChar = FontAwesome.Sharp.IconChar.User;
            this.menuusuario.IconColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(0)))));
            this.menuusuario.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.menuusuario.IconSize = 30;
            this.menuusuario.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menuusuario.Name = "menuusuario";
            this.menuusuario.Size = new System.Drawing.Size(132, 34);
            this.menuusuario.Text = "USUARIO";
            // 
            // menumantenedor
            // 
            this.menumantenedor.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menumantenedor.IconChar = FontAwesome.Sharp.IconChar.Wrench;
            this.menumantenedor.IconColor = System.Drawing.Color.Black;
            this.menumantenedor.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.menumantenedor.IconSize = 30;
            this.menumantenedor.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menumantenedor.Name = "menumantenedor";
            this.menumantenedor.Size = new System.Drawing.Size(132, 34);
            this.menumantenedor.Text = "MANTENEDOR";
            // 
            // menuventas
            // 
            this.menuventas.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menuventas.IconChar = FontAwesome.Sharp.IconChar.MoneyBill;
            this.menuventas.IconColor = System.Drawing.Color.Black;
            this.menuventas.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.menuventas.IconSize = 30;
            this.menuventas.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menuventas.Name = "menuventas";
            this.menuventas.Size = new System.Drawing.Size(132, 34);
            this.menuventas.Text = "VENTAS";
            // 
            // menucompras
            // 
            this.menucompras.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menucompras.IconChar = FontAwesome.Sharp.IconChar.ShoppingCart;
            this.menucompras.IconColor = System.Drawing.Color.Black;
            this.menucompras.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.menucompras.IconSize = 30;
            this.menucompras.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menucompras.Name = "menucompras";
            this.menucompras.Size = new System.Drawing.Size(132, 34);
            this.menucompras.Text = "COMPRAS";
            // 
            // menuclientes
            // 
            this.menuclientes.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menuclientes.IconChar = FontAwesome.Sharp.IconChar.UserAlt;
            this.menuclientes.IconColor = System.Drawing.Color.Black;
            this.menuclientes.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.menuclientes.IconSize = 30;
            this.menuclientes.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menuclientes.Name = "menuclientes";
            this.menuclientes.Size = new System.Drawing.Size(132, 34);
            this.menuclientes.Text = "CLIENTES";
            // 
            // menuproveedores
            // 
            this.menuproveedores.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menuproveedores.IconChar = FontAwesome.Sharp.IconChar.TruckField;
            this.menuproveedores.IconColor = System.Drawing.Color.Black;
            this.menuproveedores.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.menuproveedores.IconSize = 30;
            this.menuproveedores.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menuproveedores.Name = "menuproveedores";
            this.menuproveedores.Size = new System.Drawing.Size(132, 34);
            this.menuproveedores.Text = "PROVEEDORES";
            // 
            // menureportes
            // 
            this.menureportes.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menureportes.IconChar = FontAwesome.Sharp.IconChar.ChartSimple;
            this.menureportes.IconColor = System.Drawing.Color.Black;
            this.menureportes.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.menureportes.IconSize = 30;
            this.menureportes.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menureportes.Name = "menureportes";
            this.menureportes.Size = new System.Drawing.Size(132, 34);
            this.menureportes.Text = "REPORTES";
            // 
            // menuacercade
            // 
            this.menuacercade.BackColor = System.Drawing.Color.PaleTurquoise;
            this.menuacercade.IconChar = FontAwesome.Sharp.IconChar.CircleInfo;
            this.menuacercade.IconColor = System.Drawing.Color.Black;
            this.menuacercade.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.menuacercade.IconSize = 30;
            this.menuacercade.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.menuacercade.Name = "menuacercade";
            this.menuacercade.Size = new System.Drawing.Size(132, 34);
            this.menuacercade.Text = "ACERCA DE";
            // 
            // menuTitulo
            // 
            this.menuTitulo.AutoSize = false;
            this.menuTitulo.BackColor = System.Drawing.SystemColors.HotTrack;
            this.menuTitulo.Location = new System.Drawing.Point(0, 0);
            this.menuTitulo.Name = "menuTitulo";
            this.menuTitulo.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.menuTitulo.Size = new System.Drawing.Size(678, 49);
            this.menuTitulo.TabIndex = 1;
            this.menuTitulo.Text = "menuTitulo";
            // 
            // tituloSistema
            // 
            this.tituloSistema.AutoSize = true;
            this.tituloSistema.BackColor = System.Drawing.SystemColors.HotTrack;
            this.tituloSistema.Font = new System.Drawing.Font("Rockwell", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tituloSistema.ForeColor = System.Drawing.Color.Snow;
            this.tituloSistema.Location = new System.Drawing.Point(16, 15);
            this.tituloSistema.Name = "tituloSistema";
            this.tituloSistema.Size = new System.Drawing.Size(168, 19);
            this.tituloSistema.TabIndex = 2;
            this.tituloSistema.Text = "SISTEMA DE VENTAS";
            this.tituloSistema.Click += new System.EventHandler(this.label1_Click);
            // 
            // contenedor
            // 
            this.contenedor.Dock = System.Windows.Forms.DockStyle.Fill;
            this.contenedor.Location = new System.Drawing.Point(139, 49);
            this.contenedor.Name = "contenedor";
            this.contenedor.Size = new System.Drawing.Size(539, 498);
            this.contenedor.TabIndex = 3;
            // 
            // Inicio
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(678, 547);
            this.Controls.Add(this.contenedor);
            this.Controls.Add(this.tituloSistema);
            this.Controls.Add(this.menu);
            this.Controls.Add(this.menuTitulo);
            this.MainMenuStrip = this.menu;
            this.Name = "Inicio";
            this.Text = "Form1";
            this.menu.ResumeLayout(false);
            this.menu.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menu;
        private System.Windows.Forms.MenuStrip menuTitulo;
        private System.Windows.Forms.Label tituloSistema;
        private FontAwesome.Sharp.IconMenuItem menuusuario;
        private FontAwesome.Sharp.IconMenuItem menumantenedor;
        private FontAwesome.Sharp.IconMenuItem menuventas;
        private FontAwesome.Sharp.IconMenuItem menucompras;
        private FontAwesome.Sharp.IconMenuItem menuproveedores;
        private FontAwesome.Sharp.IconMenuItem menuclientes;
        private FontAwesome.Sharp.IconMenuItem menureportes;
        private FontAwesome.Sharp.IconMenuItem menuacercade;
        private System.Windows.Forms.Panel contenedor;
    }
}

