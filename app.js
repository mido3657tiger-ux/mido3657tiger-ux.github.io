const { Telegraf, Markup } = require('telegraf');

const bot = new Telegraf(process.env.BOT_TOKEN); 

const userCarts = {};

const mainMenu = (ctx) => {
    return ctx.reply(`🔥 أهلاً بك في متجر Tiger-Core الذكي! \n\nأسرع نظام أتمتة لبيع المنتجات وإدارة الطلبات تلقائياً.\n\n👇 اختر من القائمة لبدء التجربة:`, 
    Markup.inlineKeyboard([
        [Markup.button.callback('🛒 تصفح المنتجات وشراء', 'view_products')],
        [Markup.button.callback('🛍️ سلة المشتريات الخاص بك', 'view_cart')],
        [Markup.button.callback('📊 لوحة تحكم المالك (خاص بالتاجر)', 'admin_panel')],
        [
            Markup.button.url('💬 تليجرام الدعم', 'https://t.me/mido3657tiger'),
            Markup.button.url('🟢 واتساب كاش', 'https://wa.me/201098113657?text=أريد%20شراء%20سيستم%20تايجر')
        ]
    ]));
};

bot.start((ctx) => mainMenu(ctx));
bot.action('main_menu', (ctx) => mainMenu(ctx));

const products = [
    { id: '1', name: '🤖 بوت أتمتة تليجرام كامل', price: 500 },
    { id: '2', name: '🛡️ سكربت حماية وفحص ثغرات', price: 800 },
    { id: '3', name: '📈 بوت تتبع صفقات وإشارات', price: 600 }
];

bot.action('view_products', (ctx) => {
    let text = `📦 **المنتجات والأنظمة المتاحة حالياً:**\n\n`;
    let buttons = [];
    
    products.forEach(p => {
        text += `🔹 ${p.name}\n💰 السعر: ${p.price} جنيه\n\n`;
        buttons.push([Markup.button.callback(`➕ إضافة لسلتك: ${p.name.split(' ')[1]}`, `add_${p.id}`)]);
    });
    
    buttons.push([Markup.button.callback('🔙 الرجوع للقائمة', 'main_menu')]);
    ctx.reply(text, Markup.inlineKeyboard(buttons));
});

products.forEach(p => {
    bot.action(`add_${p.id}`, (ctx) => {
        const userId = ctx.from.id;
        if (!userCarts[userId]) userCarts[userId] = [];
        userCarts[userId].push(p);
        ctx.answerCbQuery(`✅ تم إضافة ${p.name} إلى سلتك!`);
    });
});

bot.action('view_cart', (ctx) => {
    const userId = ctx.from.id;
    const cart = userCarts[userId] || [];
    
    if (cart.length === 0) {
        return ctx.reply('🛒 سلتك فارغة حالياً! ادخل على المنتجات وضف حاجات عشان تجرب العظمة.', 
        Markup.inlineKeyboard([[Markup.button.callback('🛒 تصفح المنتجات', 'view_products')]]));
    }
    
    let text = `🛍️ **محتويات سلتك الحالية:**\n\n`;
    let total = 0;
    cart.forEach((p, index) => {
        text += `${index + 1}. ${p.name} (${p.price} ج)\n`;
        total += p.price;
    });
    
    text += `\n💵 **إجمالي الحساب:** ${total} جنيه مصري.\n\n👇 لإتمام الشراء وإرسال طلبك الآلي للمالك لتأكيد الدفع:`;
    
    ctx.reply(text, Markup.inlineKeyboard([
        [Markup.button.callback('✅ إرسال الطلب وتأكيد الشراء', 'checkout')],
        [Markup.button.callback('🗑️ تفريغ السلة', 'clear_cart')],
        [Markup.button.callback('🔙 القائمة الرئيسية', 'main_menu')]
    ]));
});

bot.action('clear_cart', (ctx) => {
    userCarts[ctx.from.id] = [];
    ctx.reply('🗑️ تم تفريغ سلتك بنجاح.', Markup.inlineKeyboard([[Markup.button.callback('🔙 القائمة الرئيسية', 'main_menu')]]));
});

bot.action('checkout', (ctx) => {
    const userId = ctx.from.id;
    ctx.reply(`🎉 تم إرسال طلبك بنجاح! جاري تحضير الملفات من قبل المطور وتأكيد التحويل عبر فودافون كاش أو إنستا باي.`);
    userCarts[userId] = [];
});

bot.action('admin_panel', (ctx) => {
    ctx.reply(`📊 **لوحة تحكم المالك الاحترافية (Tiger-Dashboard)**\n\n` +
              `هنا التاجر بيقدر يدير البوت بالكامل:\n` +
              `👥 عدد المشتركين النشطين: 147 تاجر ومشتري\n` +
              `💰 إجمالي المبيعات اليوم: 2,400 جنيه\n` +
              `📦 عدد الطلبات المعلقة: 3 طلبات\n\n` +
              `👇 الأوامر المتاحة لك كمالك للنظام:`,
    Markup.inlineKeyboard([
        [Markup.button.callback('📢 إرسال إعلان لكل المشتركين', 'broadcast')],
        [Markup.button.callback('➕ إضافة منتج جديد للمتجر', 'add_prod_admin')],
        [Markup.button.callback('🔙 العودة كزبون', 'main_menu')]
    ]));
});

bot.action('broadcast', (ctx) => ctx.reply('📢 ميزة الإرسال الجماعي: اكتب رسالتك وهيتم بثها لـ 147 مشترك في ثانية واحدة!'));
bot.action('add_prod_admin', (ctx) => ctx.reply('➕ ميزة إضافة منتج: اكتب اسم المنتج وسعره وهيظهر تلقائي في قائمة الزباين!'));

bot.launch().then(() => console.log('🤖 Super Tiger Bot with Correct WhatsApp is Live!'));
