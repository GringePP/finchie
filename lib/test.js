Function.prototype.apply = function(ctx, rest) {
    if (!ctx) {
        ctx = global;
    }
    ctx.fn = this;
    let r = ctx.fn(...rest);
    delete ctx.fn;
    return r;
}

function fooo() {
    console.log(this.name);
    console.log(arguments);
}

let obj = {
    name: 'bob'
}

fooo.apply(obj, [1, 2 ,3]);