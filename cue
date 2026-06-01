<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Nana</title>
<style>
:root{
  --font:-apple-system,BlinkMacSystemFont,"SF Pro Text","SF Pro Display","Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
  --brand:#16a34a;--brand-soft:#e6f6ec;--brand-mid:#b6e3c6;
  --teal:#0d9488;--teal-soft:#e7f6f4;--teal-mid:#9fd8d1;
  --warm:#c77f12;--warm-soft:#fff6e8;--warm-mid:#ffe6c2;
  --violet:#7c5cff;--violet-soft:#efeaff;
  --rose:#d6533f;--rose-soft:#fff1ee;--rose-mid:#ffd9d2;
  --ink:#1c1c1e;--muted:#8e8e93;--faint:#b8b8be;
  --line:rgba(60,60,67,.10);--bg:#fff;--bg2:#f6f7f9;
  --green:#34c759;--amber:#ff9f0a;--g-gold:#f5b301;--g-amber:#ff7a18;--g-blue:#4a90d9;--g-cyan:#2ec4d6;--rail-gold:rgba(245,190,70,.6);--rail-blue:rgba(95,160,225,.6);
  --shadow:0 2px 8px rgba(0,0,0,.05);
  --r-card:20px;--r-pill:999px;--r-inner:14px;--r-chip:999px;
}
*{box-sizing:border-box;margin:0;padding:0;-webkit-tap-highlight-color:transparent}
html,body{height:100%}
body{font-family:var(--font);background:#fff;color:var(--ink);display:flex;align-items:center;justify-content:center;padding:20px;min-height:100vh}
/* iPhone 17 standard — 393×852pt logical, ~55pt corner radius. Design is locked to this size
   so it never deforms on larger devices (e.g. 17 Pro Max 440×956); the device just gives extra
   breathing room around the same UI. */
.phone{width:393px;height:852px;background:var(--bg);border-radius:55px;box-shadow:0 50px 120px rgba(20,40,80,.25),0 8px 22px rgba(0,0,0,.07);border:1px solid rgba(0,0,0,.06);overflow:hidden;position:relative;display:flex;flex-direction:column}
@media (max-height:880px){.phone{transform:scale(.92);transform-origin:center center}}
@media (max-height:800px){.phone{transform:scale(.82)}}
/* Dynamic Island — 125×37pt pill, ~11pt from top, centered */
.island{position:absolute;top:11px;left:50%;transform:translateX(-50%);width:125px;height:37px;border-radius:19px;background:#000;z-index:100;pointer-events:none}
/* Home indicator — 134×5pt bar */
.home-ind{position:absolute;bottom:8px;left:50%;transform:translateX(-50%);width:134px;height:5px;border-radius:3px;background:rgba(0,0,0,.35);z-index:60;pointer-events:none}
.hdr-bg{position:absolute;top:0;left:0;right:0;height:120px;z-index:49;background:linear-gradient(to bottom,rgba(251,252,253,.98) 0%,rgba(251,252,253,.92) 45%,rgba(251,252,253,0) 100%);backdrop-filter:blur(16px);-webkit-backdrop-filter:blur(16px);-webkit-mask-image:linear-gradient(to bottom,#000 45%,transparent 100%);mask-image:linear-gradient(to bottom,#000 45%,transparent 100%);pointer-events:none}
.hdr{padding:62px 70px 12px 20px;position:absolute;top:0;left:0;right:0;z-index:50;pointer-events:none}
.avatar{position:absolute;right:18px;top:62px;pointer-events:auto;width:43px;height:43px;border-radius:50%;background:linear-gradient(135deg,#e6f6ec,#cfeadb);display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:700;color:#1e7e44;cursor:pointer;border:1.5px solid #fff;box-shadow:0 2px 8px rgba(0,0,0,.06);transition:transform .15s,box-shadow .15s}
.avatar:active{transform:scale(.94)}
.avatar:hover{box-shadow:0 2px 8px rgba(0,0,0,.06)}
.kids{display:flex;gap:8px;pointer-events:auto}
.kid{display:flex;align-items:center;gap:7px;padding:6px 12px 6px 7px;border-radius:var(--r-pill);background:var(--bg2);border:1.5px solid transparent;cursor:pointer;transition:.18s}
.kid .av{width:28px;height:28px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:15px;background:#fff}
.kid .nm{font-size:13.5px;font-weight:600;color:var(--muted)}
.kid.on{background:var(--brand);border-color:var(--brand)}
.kid.on .nm{color:#fff}
.kid.on .av{background:rgba(255,255,255,.85)}
.kid,.vkid{min-height:43px;align-items:center}
.vkid{justify-content:center;padding:6px 14px}.vkid .nm{font-size:13.5px}
.vkid .vcnt{width:28px;height:28px;border-radius:50%;background:var(--rose);color:#fff;font-size:13px;font-weight:700;display:flex;align-items:center;justify-content:center}
.vkid.on{background:var(--brand);border-color:var(--brand)}
.vkid.on .nm{color:#fff}
.vkid.on .vcnt{background:#fff;color:var(--brand)}
.hdr-sub{font-size:12px;color:var(--muted);display:flex;align-items:center;gap:7px;pointer-events:auto}
.body{flex:1;overflow-y:auto;overflow-x:hidden;background:#fff}.body::-webkit-scrollbar{display:none}
.pad{padding:112px 18px 110px}
.sec-lbl{font-size:11px;letter-spacing:.1em;text-transform:uppercase;color:var(--faint);font-weight:700;margin:22px 2px 11px;display:flex;align-items:center;gap:8px}
.sec-lbl:first-child{margin-top:4px}.sec-lbl .ct{color:var(--faint);font-weight:600;letter-spacing:0;text-transform:none}
.chip{display:inline-flex;align-items:center;gap:5px;padding:3px 9px 3px 4px;border-radius:var(--r-chip);font-size:11px;font-weight:700}
.chip .ca{width:17px;height:17px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:10px;background:#fff}
.chip.sarah{background:var(--brand-soft);color:var(--brand)}.chip.tommy{background:var(--violet-soft);color:var(--violet)}
/* Today — timeline rail (dot centered on line, dot covers line) */
.timeline{position:relative;padding-left:34px}

.tl-row{position:relative;margin-bottom:13px}
.tl-row.t-dd{--top:var(--rail-gold);--bot:var(--rail-gold)}
.tl-row.t-nn{--top:var(--rail-blue);--bot:var(--rail-blue)}
.tl-row.t-dn{--top:var(--rail-gold);--bot:var(--rail-blue)}
.tl-row.t-nd{--top:var(--rail-blue);--bot:var(--rail-gold)}
.tl-row::before{content:"";position:absolute;left:-24px;top:0;height:50%;width:2px;background:var(--top,var(--line))}
.tl-row::after{content:"";position:absolute;left:-24px;top:50%;bottom:-13px;width:2px;background:var(--bot,var(--line))}
.tl-row:first-child::before{display:none}
.tl-row:last-child::after{bottom:50%}
.tl-zone{display:flex;align-items:center;gap:10px;padding:10px 13px;background:#fff;border:1px solid var(--line);border-radius:var(--r-card);box-shadow:0 1px 3px rgba(0,0,0,.03)}
.tl-zone .zt{font-size:11.5px;color:var(--faint);font-feature-settings:"tnum";flex:0 0 46px;white-space:nowrap;display:flex;flex-direction:column;align-items:center;line-height:1.25}.tl-zone .zt .zline{width:1.5px;height:9px;background:var(--line);margin:2px 0;border-radius:1px}
.tl-zone.act{display:block;cursor:pointer}
.tl-zone.act .az-head{display:flex;align-items:center;gap:10px}
.tl-zone.act .zchev{margin-left:auto;color:var(--faint);font-size:12px;transition:transform .3s}
.tl-zone.act.open .zchev{transform:rotate(180deg)}
.az-exp{max-height:0;overflow:hidden;transition:max-height .35s ease,opacity .25s,margin .25s;opacity:0}
.tl-zone.act.open .az-exp{max-height:160px;opacity:1;margin-top:11px;padding-top:11px;border-top:1px solid var(--line)}
.az-row{display:flex;justify-content:space-between;font-size:12px;padding:3px 0}
.az-row span{color:var(--muted)}.az-row b{font-weight:600}
.az-note{font-size:11px;color:var(--faint);margin-top:7px;line-height:1.45;font-style:italic}







.sunrow{display:flex;align-items:center;gap:10px;padding:11px 14px;border-radius:var(--r-card);background:#fff;border:1px solid var(--g-gold)}
.sunrow.set{border-color:var(--g-blue)}
.sunrow .st{font-size:11.5px;color:var(--faint);font-feature-settings:"tnum";flex:0 0 46px}
.sunrow .sl{font-size:13px;font-weight:600;color:#9a6a00}
.sunrow.set .sl{color:#2f5d8c}

.tl-zone .zl{font-size:13px;font-weight:600;color:var(--ink)}
.tl-zone .zs{font-size:11.5px;color:var(--muted);margin-left:auto}

.tl-dot{display:none}




.report{background:#fff;border:1px solid var(--line);border-radius:var(--r-card);padding:14px 15px;cursor:pointer;transition:.2s}
.report:active{transform:scale(.99)}
.r-top{display:flex;align-items:center;gap:9px}.r-ico{font-size:16px}.r-title{font-size:14px;font-weight:700}
.r-time{margin-left:auto;font-size:11px;color:var(--faint);font-feature-settings:"tnum";display:flex;align-items:center;gap:5px}
.r-chev{transition:transform .3s;display:inline-block}.report.open .r-chev{transform:rotate(180deg)}
.r-body{font-size:12.5px;color:#5b5b62;margin-top:8px;line-height:1.55}
.r-detail{max-height:0;overflow:hidden;transition:max-height .35s ease,opacity .25s,margin .25s;opacity:0}
.report.open .r-detail{max-height:360px;opacity:1;margin-top:12px;padding-top:12px;border-top:1px solid var(--line)}
.event{display:grid;grid-template-columns:46px 1fr;gap:10px;padding:5px 0;align-items:start}
.ev-time{font-size:12px;color:var(--muted);font-feature-settings:"tnum";padding-top:1px}
.ev-text{font-size:12.5px;color:#3a3a40;line-height:1.45}.ev-text .es{color:var(--muted);font-size:11.5px}
/* cue */
.cue{margin-bottom:14px;border-radius:var(--r-card);padding:17px;cursor:pointer;background:#fff;border:1px solid var(--brand-mid);box-shadow:var(--shadow);transition:transform .2s}
.cue:active{transform:scale(.99)}
.c-meta{display:flex;align-items:center;gap:8px;margin-bottom:9px}
.bars{display:flex;gap:2.5px;align-items:flex-end;height:13px}.bars i{width:3px;border-radius:2px;background:var(--brand-mid)}.bars i.on{background:var(--brand)}
.bars i:nth-child(1){height:5px}.bars i:nth-child(2){height:8px}.bars i:nth-child(3){height:11px}.bars i:nth-child(4){height:13px}
.c-gen{font-size:11px;color:var(--faint);font-weight:600}
.c-tag{margin-left:auto;font-size:10px;letter-spacing:.1em;text-transform:uppercase;color:var(--brand);font-weight:700}
.c-q{font-size:16.5px;font-weight:700;line-height:1.42;letter-spacing:-.01em}
.c-ctx{font-size:12.5px;color:var(--muted);margin-top:9px;line-height:1.45;padding-top:9px;border-top:1px dashed var(--line)}
.c-hint{display:flex;align-items:center;gap:6px;margin-top:12px;font-size:12px;color:var(--brand);font-weight:600}.c-hint .chev{transition:transform .3s}
.c-exp{max-height:0;overflow:hidden;transition:max-height .4s ease,opacity .3s,margin .3s;opacity:0}
.cue.open .c-exp{max-height:470px;opacity:1;margin-top:13px}.cue.open .chev{transform:rotate(180deg)}
.sig{display:flex;gap:9px;padding:6px 0;border-top:1px solid var(--line)}.sig:first-child{border-top:none}
.sig-d{font-size:11px;color:var(--faint);font-variant-numeric:tabular-nums;flex:0 0 58px;padding-top:1px}
.sig-x{font-size:12px;line-height:1.4}.sig-x b{font-weight:600}.sig-x span{color:var(--muted)}
.c-act{margin-top:13px;background:var(--brand);color:#fff;border-radius:var(--r-inner);padding:13px 15px}
.c-act .l{font-size:10px;letter-spacing:.1em;text-transform:uppercase;opacity:.8;font-weight:700}.c-act .t{font-size:14.5px;font-weight:600;margin-top:5px;line-height:1.45}
.cbtns{display:flex;gap:9px;margin-top:12px}
.cb{flex:1;border:none;border-radius:var(--r-pill);padding:13px;font-size:13px;font-weight:600;font-family:inherit;cursor:pointer;transition:transform .15s}.cb:active{transform:scale(.96)}
.cb.pri{background:var(--brand);color:#fff}
.cb.pri[disabled]{opacity:.45;cursor:not-allowed}.cb.gh{background:var(--bg2);color:var(--muted)}
.cb.tint{background:var(--brand-soft);color:var(--brand)}
.cue.done{background:#fff;border-color:var(--line);box-shadow:none}
.c-resolved{display:flex;align-items:center;gap:9px}
.c-resolved .rd{width:13px;height:13px;border-radius:50%;border:2px solid var(--brand);background:var(--brand-soft);flex:0 0 13px}
.c-resolved .rt{font-size:13px;font-weight:600;color:var(--brand)}.c-resolved .rs{font-size:11.5px;color:var(--faint);font-style:italic}
.tray{border-radius:var(--r-card);padding:14px 15px;background:linear-gradient(160deg,#fffaf2,#fff6e8);border:1px solid var(--warm-mid);margin-bottom:11px}
.t-top{display:flex;align-items:center;gap:8px}.t-ico{font-size:14px}
.t-lbl{font-size:10px;letter-spacing:.1em;text-transform:uppercase;font-weight:700;color:var(--warm)}.t-when{margin-left:auto;font-size:11px;color:var(--warm);font-weight:600}
.t-txt{font-size:13px;font-weight:600;margin-top:7px;line-height:1.45}.t-foot{font-size:10.5px;color:var(--faint);margin-top:9px;font-style:italic;padding-top:8px;border-top:1px dashed var(--warm-mid)}
/* ===== inbox: status-sorted single column ===== */
.item{border-radius:var(--r-card);padding:17px;margin-bottom:14px;background:#fff;border:1px solid var(--brand-mid);box-shadow:var(--shadow);position:relative;overflow:hidden;transition:transform .2s}
.item:active{transform:scale(.99)}

.item.safety{border-color:var(--rose-mid)}.item.device{border-color:var(--warm-mid)}
.item.needs{border-color:var(--teal-mid)}.item.progress{border-color:var(--line);box-shadow:none}
.item.ready{border-color:var(--brand-mid)}.item.kept{border-color:var(--line);box-shadow:none}
.it-top{display:flex;align-items:center;gap:8px;margin-bottom:8px}
.it-tag{font-size:9.5px;letter-spacing:.08em;text-transform:uppercase;font-weight:700;padding:3px 8px;border-radius:7px}
.it-tag.safety{background:var(--rose-soft);color:var(--rose)}.it-tag.device{background:var(--warm-soft);color:var(--warm)}
.it-tag.research{background:#fff;color:var(--teal);border:1px solid var(--teal-mid)}.it-tag.kept{background:#fff;color:var(--muted);border:1px solid var(--line)}
.it-when{margin-left:auto;font-size:11px;color:var(--faint);font-weight:600}
.it-t{font-size:14.5px;font-weight:700;line-height:1.38}
.it-s{font-size:12.5px;color:var(--muted);margin-top:6px;line-height:1.5}
.it-foot{display:flex;align-items:center;margin-top:11px}
.it-actions{display:flex;gap:8px;margin-top:12px}
.ibtn{border:none;border-radius:var(--r-pill);padding:10px 14px;font-size:12.5px;font-weight:600;font-family:inherit;cursor:pointer;transition:transform .15s}.ibtn:active{transform:scale(.96)}
.ibtn.pri{background:var(--ink);color:#fff;flex:1}.ibtn.teal{background:var(--brand);color:#fff;flex:1}
.ibtn.gh{background:var(--bg2);color:var(--muted)}
. qa{display:flex;gap:8px;flex-wrap:wrap}
.qachip{border:1px solid var(--teal-mid);background:#fff;color:var(--teal);border-radius:var(--r-pill);padding:10px 13px;font-size:12.5px;font-weight:600;font-family:inherit;cursor:pointer}
.prog{height:6px;border-radius:4px;background:var(--bg2);margin-top:11px;overflow:hidden}.prog i{display:block;height:100%;background:var(--teal-mid);border-radius:4px}
.prog-l{font-size:11px;color:var(--faint);margin-top:6px}
/* expanded research report inside item */
.rep-exp{max-height:0;overflow:hidden;transition:max-height .45s ease,opacity .3s,margin .3s;opacity:0}
.item.open .rep-exp{max-height:900px;opacity:1;margin-top:13px;padding-top:13px;border-top:1px solid var(--line)}
.moat{display:flex;gap:8px;background:#f3faf5;border:1px solid var(--brand-soft);border-radius:var(--r-inner);padding:10px 12px;margin-bottom:11px;font-size:11px;color:#2f6e44;line-height:1.45}.moat b{color:var(--brand)}
.blk{border:1px solid var(--line);border-radius:var(--r-inner);padding:13px 14px;margin-bottom:10px;background:#fff}
.b-lbl{font-size:10px;letter-spacing:.08em;text-transform:uppercase;font-weight:700;color:var(--teal);margin-bottom:7px}
.b-txt{font-size:12.5px;line-height:1.55;color:#3a3a40}.b-txt b{color:var(--ink);font-weight:600}
.src{display:inline-block;font-size:10px;color:var(--faint);background:var(--bg2);padding:2px 7px;border-radius:6px;margin-top:8px;margin-right:5px}
.bchart{display:flex;align-items:flex-end;gap:4px;height:46px;margin:9px 0 3px}.bchart .bar{flex:1;background:var(--brand-mid);border-radius:3px 3px 0 0}.bchart .bar.hi{background:var(--amber)}
.nl{font-size:10px;color:var(--green);margin-top:3px}
.route{background:var(--rose-soft);border:1px solid var(--rose-mid);border-radius:var(--r-inner);padding:13px 14px;margin-bottom:10px}.route .b-lbl{color:var(--rose)}
.rbtn{margin-top:10px;width:100%;border:1px solid var(--rose-mid);background:#fff;color:var(--rose);border-radius:var(--r-pill);padding:11px;font-size:12px;font-weight:600;font-family:inherit;cursor:pointer}
.disc{font-size:11px;color:var(--faint);line-height:1.5;text-align:center;margin:8px 0 10px;font-style:italic}
.empty{text-align:center;padding:20px 16px;color:var(--faint);font-size:12px;line-height:1.6}.empty .ei{font-size:26px;opacity:.5;margin-bottom:7px}
.nav{position:absolute;left:0;right:0;bottom:0;z-index:50;display:flex;justify-content:flex-end;padding:10px 18px 28px;pointer-events:none;background:linear-gradient(to top,rgba(251,252,253,.95) 40%,rgba(251,252,253,0))}
.nav-pill{display:flex;gap:4px;padding:5px;border-radius:var(--r-pill);pointer-events:auto;background:rgba(255,255,255,.62);backdrop-filter:blur(40px) saturate(180%);-webkit-backdrop-filter:blur(40px) saturate(180%);box-shadow:0 6px 20px rgba(0,0,0,.08),0 0 0 .5px rgba(0,0,0,.05)}
.navi{display:flex;align-items:center;gap:7px;padding:10px;border-radius:var(--r-pill);cursor:pointer;color:var(--muted);position:relative;transition:.2s}
.navi[data-tab="inbox"] svg{transform:scale(.95)}
.navi svg{width:21px;height:21px;display:block;fill:none;stroke:currentColor;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.navi .nt{font-size:13px;font-weight:600;max-width:0;overflow:hidden;white-space:nowrap;opacity:0;transition:max-width .25s ease,opacity .2s,margin .25s}
.navi.on{background:#fff;color:var(--brand);box-shadow:none;padding:10px 16px}
.navi.on .nt{max-width:80px;opacity:1;margin-right:2px}
.navi .cntbadge{position:absolute;top:3px;right:3px;background:var(--rose);color:#fff;font-size:9px;font-weight:700;min-width:15px;height:15px;border-radius:8px;display:flex;align-items:center;justify-content:center;padding:0 4px;border:1.5px solid #fff}
.toast{position:absolute;left:50%;bottom:90px;transform:translateX(-50%) translateY(20px);background:rgba(28,28,30,.94);color:#fff;font-size:12.5px;font-weight:600;padding:11px 18px;border-radius:24px;opacity:0;pointer-events:none;transition:.3s;z-index:20;white-space:nowrap;box-shadow:0 8px 24px rgba(0,0,0,.2)}
.toast.show{opacity:1;transform:translateX(-50%) translateY(0)}

/* settings & archive pages */
.subpage{position:absolute;inset:0;z-index:75;background:var(--bg2);display:flex;flex-direction:column;opacity:0;pointer-events:none;transition:opacity .22s}
.subpage.on{opacity:1;pointer-events:auto}
.subpage .body{flex:1;background:var(--bg2)}
.subpage .pad{padding:0 18px 100px}
.pg-hdr{padding:58px 18px 10px;display:flex;align-items:center;gap:12px;background:var(--bg2);flex-shrink:0}
.pg-back{width:36px;height:36px;border-radius:50%;background:#fff;border:1px solid var(--line);display:flex;align-items:center;justify-content:center;cursor:pointer;font-size:18px;color:var(--ink);flex:0 0 36px;box-shadow:var(--shadow)}
.pg-back:active{transform:scale(.94)}
.pg-title{flex:1;text-align:center;font-size:17px;font-weight:700;margin-right:36px}
.pg-prof{display:flex;align-items:center;gap:14px;padding:14px 16px;background:#fff;border:1px solid var(--line);border-radius:var(--r-card);margin-bottom:18px;cursor:pointer;box-shadow:var(--shadow)}
.pg-av{width:52px;height:52px;border-radius:50%;background:linear-gradient(135deg,#e6f6ec,#cfeadb);display:flex;align-items:center;justify-content:center;font-size:18px;font-weight:700;color:#1e7e44;flex:0 0 52px}
.pg-name{font-size:16px;font-weight:700}
.pg-meta{font-size:12.5px;color:var(--muted);margin-top:3px}
.pg-kids{margin-bottom:18px}
.pg-klbl{font-size:11px;letter-spacing:.08em;text-transform:uppercase;color:var(--faint);font-weight:700;margin:0 2px 10px}
.pg-krow{display:flex;gap:12px;align-items:center}
.pg-kid{display:flex;flex-direction:column;align-items:center;gap:5px;cursor:pointer}
.pg-kav{width:48px;height:48px;border-radius:50%;background:#fff;border:1.5px solid var(--line);display:flex;align-items:center;justify-content:center;font-size:22px}
.pg-knm{font-size:11.5px;font-weight:600;color:var(--muted)}
.pg-kadd{width:48px;height:48px;border-radius:50%;border:1.5px dashed var(--line);background:transparent;display:flex;align-items:center;justify-content:center;color:var(--faint);font-size:22px;cursor:pointer}
.sh-sec{font-size:11px;letter-spacing:.08em;text-transform:uppercase;color:var(--faint);font-weight:700;margin:18px 2px 8px}
.sh-card{background:#fff;border:1px solid var(--line);border-radius:var(--r-card);overflow:hidden;margin-bottom:14px;box-shadow:var(--shadow)}
.sh-row{display:flex;align-items:center;gap:13px;padding:13px 16px;cursor:pointer;transition:background .15s}
.sh-row:active{background:var(--bg2)}
.sh-row+.sh-row{border-top:1px solid var(--line)}
.sh-ico{width:34px;height:34px;border-radius:9px;display:flex;align-items:center;justify-content:center;flex:0 0 34px;color:#fff;background:var(--bg2);border:1px solid var(--line)}
.sh-ico.k{background:linear-gradient(135deg,#16a34a,#0d9488);border:none}
.sh-ico.d{background:linear-gradient(135deg,#1882FF,#0d9488);border:none}
.sh-ico.n{background:linear-gradient(135deg,#ff9f0a,#ff6b5e);border:none}
.sh-ico.p{background:linear-gradient(135deg,#7c5cff,#1882FF);border:none}
.sh-ico.r{background:linear-gradient(135deg,#0d9488,#16a34a);border:none}
.sh-ico.a{background:linear-gradient(135deg,#8e8e93,#3a3a40);border:none}
.sh-ico svg{width:18px;height:18px;fill:none;stroke:currentColor;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.sh-body{flex:1;min-width:0}
.sh-rt{font-size:14.5px;font-weight:600;line-height:1.3}
.sh-rs{font-size:12px;color:var(--muted);margin-top:2px;line-height:1.4}
.sh-val{font-size:13px;color:var(--muted);margin-right:4px}
.sh-chev{color:var(--faint);font-size:18px}
.sh-foot{text-align:center;font-size:11px;color:var(--faint);padding:16px 0 8px}
/* archive */
.arc-lbl{font-size:11px;letter-spacing:.1em;text-transform:uppercase;color:var(--faint);font-weight:700;margin:4px 2px 10px}
.arc-kids{display:flex;gap:8px;margin-bottom:14px;flex-wrap:wrap}
.arc-kid{display:flex;align-items:center;gap:7px;padding:6px 12px 6px 7px;border-radius:var(--r-pill);background:#fff;border:1.5px solid var(--line);cursor:pointer;transition:.18s}
.arc-kid.on{background:var(--brand-soft);border-color:var(--brand-mid)}
.arc-kid .av{width:28px;height:28px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:15px;background:var(--bg2)}
.arc-kid .nm{font-size:13.5px;font-weight:600;color:var(--muted)}
.arc-kid.on .nm{color:var(--brand)}
.arc-kid .cnt{min-width:20px;height:20px;border-radius:10px;background:var(--bg2);color:var(--muted);font-size:11px;font-weight:700;display:flex;align-items:center;justify-content:center;padding:0 6px}
.arc-kid.on .cnt{background:var(--brand);color:#fff}
.arc-flt{display:flex;gap:8px;flex-wrap:wrap;margin-bottom:8px}
.arc-chip{padding:8px 14px;border-radius:var(--r-pill);font-size:12.5px;font-weight:600;background:#fff;border:1px solid var(--line);color:var(--muted);cursor:pointer}
.arc-chip.on{background:var(--ink);color:#fff;border-color:var(--ink)}
.arc-hint{font-size:11px;color:var(--faint);line-height:1.5;margin-bottom:6px}
.arc-sum{font-size:11px;color:var(--faint);margin-bottom:12px}
.arc-card{background:#fff;border:1px solid var(--line);border-radius:var(--r-card);padding:14px 15px;margin-bottom:11px;cursor:pointer;box-shadow:var(--shadow);transition:transform .15s}
.arc-card:active{transform:scale(.99)}
.arc-card.open .arc-chev{transform:rotate(180deg)}
.arc-top{display:flex;align-items:center;gap:8px;margin-bottom:8px}
.arc-tag{font-size:10px;font-weight:700;padding:3px 9px;border-radius:7px}
.arc-tag.keep{background:var(--brand-soft);color:var(--brand)}
.arc-tag.stable{background:var(--bg2);color:var(--muted);border:1px solid var(--line)}
.arc-date{margin-left:auto;font-size:11px;color:var(--faint);font-weight:600}
.arc-t{font-size:14px;font-weight:700;line-height:1.38;padding-right:18px;position:relative}
.arc-chev{position:absolute;right:0;top:2px;color:var(--faint);font-size:12px;transition:transform .3s}
.arc-exp{max-height:0;overflow:hidden;transition:max-height .4s ease,opacity .25s,margin .25s;opacity:0}
.arc-card.open .arc-exp{max-height:900px;opacity:1;margin-top:12px;padding-top:12px;border-top:1px solid var(--line)}
.phone.sub .hdr,.phone.sub .nav,.phone.sub .fab,.phone.sub .hdr-bg{display:none}


/* Today open-questions feed (5 cards, cue-style across all variants) */
.tcard{margin-bottom:14px;border-radius:var(--r-card);padding:17px;background:#fff;border:1px solid var(--brand-mid);box-shadow:var(--shadow);transition:transform .2s;position:relative;overflow:hidden}
.tcard:active{transform:scale(.99)}
.tcard.headsup{border-color:var(--rose-mid)}
.tcard.needs,.tcard.question{border-color:var(--teal-mid)}
.tcard.ready{border-color:var(--brand-mid)}
.tcard.watching{border-color:var(--line);box-shadow:none}
.tc-top{display:flex;align-items:center;gap:8px;margin-bottom:9px}
.tc-tag{font-size:9.5px;letter-spacing:.08em;text-transform:uppercase;font-weight:700;padding:3px 8px;border-radius:7px}
.tc-tag.headsup{background:#fff;color:var(--rose);border:1px solid var(--rose-mid)}
.tc-tag.needs,.tc-tag.question{background:#fff;color:var(--teal);border:1px solid var(--teal-mid)}
.tc-tag.ready{background:#fff;color:var(--brand);border:1px solid var(--brand-mid)}
.tc-tag.watching{background:#fff;color:var(--muted);border:1px solid var(--line)}
.tc-tag.cue{background:#fff;color:var(--brand);border:1px solid var(--brand-mid)}
.tc-when{margin-left:auto;font-size:11px;color:var(--faint);font-weight:600}
.tc-t{font-size:14.5px;font-weight:700;line-height:1.4;letter-spacing:-.005em}
.tc-s{font-size:12.5px;color:var(--muted);margin-top:7px;line-height:1.5}
.tc-actions{display:flex;gap:8px;margin-top:12px}
.tc-actions.right{justify-content:flex-end}
.cb.sm{flex:0 0 auto;padding:9px 16px;font-size:13px;width:auto;min-width:0}
.tc-actions.qa{flex-wrap:wrap}
.tc-prog{height:5px;border-radius:3px;background:rgba(0,0,0,.06);margin-top:11px;overflow:hidden}.tc-prog i{display:block;height:100%;background:var(--faint);border-radius:3px}
.tc-progl{font-size:11px;color:var(--faint);margin-top:6px;font-style:italic}


.statusbar{position:absolute;top:0;left:0;right:0;height:54px;display:flex;align-items:center;justify-content:space-between;padding:17px 30px 0;z-index:95;pointer-events:none;color:var(--ink)}
.sb-t{font-size:15px;font-weight:600;letter-spacing:.3px}
.sb-r{display:flex;align-items:center;gap:6px}
.sb-r .sig{width:18px;height:12px;fill:var(--ink)}
.sb-r .wifi{width:17px;height:13px;color:var(--ink)}
.batt-b{display:inline-block;width:24px;height:12px;border:1px solid rgba(0,0,0,.35);border-radius:3px;position:relative;padding:1.5px}
.batt-b::after{content:"";position:absolute;right:-3px;top:3.5px;width:2px;height:5px;background:rgba(0,0,0,.35);border-radius:0 1px 1px 0}
.batt-b i{display:block;height:100%;background:var(--ink);border-radius:1px}
/* live transit card + mini map */
.tcard.transit{border-color:var(--brand);overflow:hidden}
.tc-live{display:inline-flex;align-items:center;gap:5px}
.tc-live::before{content:"";width:7px;height:7px;border-radius:50%;background:var(--brand);animation:livep 1.4s ease-in-out infinite}
@keyframes livep{0%,100%{opacity:1;transform:scale(1)}50%{opacity:.35;transform:scale(.7)}}
.map{margin-top:12px;border-radius:14px;overflow:hidden;border:1px solid var(--line);background:#f4f6f4}
.map svg{display:block;width:100%;height:148px}
.map .street{stroke:#e2e6e2;stroke-width:7;stroke-linecap:round}
.map .route{stroke:var(--brand);stroke-width:3.5;fill:none;stroke-linecap:round;stroke-dasharray:5 6}
.map .here{fill:var(--brand)}
.map .pulse{fill:var(--brand);opacity:.25;animation:mp 1.8s ease-out infinite}
@keyframes mp{0%{r:6;opacity:.4}100%{r:20;opacity:0}}
.map .mk{fill:#fff;stroke:var(--muted);stroke-width:2}
.map .mlbl{font:600 10px var(--font);fill:var(--ink)}
.map .mlbl.s{fill:var(--muted)}
.tc-eta{display:flex;gap:14px;margin-top:11px;font-size:12px}
.tc-eta b{font-weight:700}.tc-eta span{color:var(--muted)}
.tc-track{margin-top:11px;width:100%;border:1px solid var(--brand-mid);background:#fff;color:var(--brand);border-radius:var(--r-pill);padding:11px;font-size:13px;font-weight:600;font-family:inherit;cursor:pointer}


.live-row{cursor:pointer}
.live-row .tl-live-dot{position:absolute;left:-27px;top:50%;transform:translateY(-50%);width:8px;height:8px;border-radius:50%;background:var(--brand);;z-index:3}
.livebar{display:flex;align-items:center;gap:9px;padding:11px 14px;border-radius:var(--r-card);background:#fff;border:1px solid var(--brand);box-shadow:0 1px 4px rgba(0,0,0,.05)}
.lb-pulse{width:7px;height:7px;border-radius:50%;background:var(--brand);animation:livep 1.4s ease-in-out infinite;flex:0 0 7px}
@keyframes livep{0%,100%{opacity:1}50%{opacity:.3}}
.lb-txt{font-size:13.5px;font-weight:700}
.lb-eta{margin-left:auto;font-size:11.5px;color:var(--brand);font-weight:600;font-feature-settings:"tnum"}
.lb-chev{color:var(--faint);font-size:16px}
.tl-row.no-rail::before,.tl-row.no-rail::after{display:none}
.transit-card{flex:1;border:1px solid var(--brand-mid);border-radius:var(--r-card);padding:13px;background:#fff}

.seg{position:relative;display:flex;background:rgba(118,118,128,.12);border-radius:10px;padding:2px;min-height:43px;align-items:stretch}
.seg-thumb{position:absolute;top:2px;bottom:2px;left:2px;width:calc((100% - 4px)/var(--seg-n));border-radius:8px;background:#fff;box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 1px rgba(0,0,0,.04);transform:translateX(calc(var(--seg-i) * 100%));transition:transform .28s cubic-bezier(.32,.72,0,1)}
.seg-opt{flex:1;position:relative;z-index:1;border:none;background:none;font-family:inherit;font-size:13.5px;font-weight:600;color:var(--muted);cursor:pointer;display:flex;align-items:center;justify-content:center;gap:6px;transition:color .2s}
.seg-opt.on{color:var(--ink)}
.seg-cnt{min-width:18px;height:18px;border-radius:9px;background:var(--rose);color:#fff;font-size:10.5px;font-weight:700;display:flex;align-items:center;justify-content:center;padding:0 5px}
.today-h{display:flex;align-items:baseline;gap:9px;margin:18px 2px 14px}
.today-t{font-size:18px;font-weight:700;letter-spacing:-.01em;color:var(--ink)}
.today-d{font-size:12.5px;font-weight:600;color:var(--faint);font-feature-settings:"tnum"}

.tcard.leaving,.cue.leaving{animation:cardOut .26s cubic-bezier(.4,0,1,1) forwards;pointer-events:none}
@keyframes cardOut{to{opacity:0;transform:scale(.9) translateY(-8px);max-height:0;margin-bottom:0;padding-top:0;padding-bottom:0}}
.navi.pop svg{animation:navpop .42s cubic-bezier(.34,1.56,.64,1)}
@keyframes navpop{0%{transform:scale(1)}45%{transform:scale(1.25)}100%{transform:scale(1)}}
.ib-sec{font-size:11px;letter-spacing:.1em;text-transform:uppercase;color:var(--faint);font-weight:700;margin:18px 2px 14px}
.ib-sec:not(:first-child){margin-top:20px}
.ib-sec-quiet{color:var(--faint);opacity:.8}
.ib-note{text-transform:none;letter-spacing:0;font-weight:500;font-size:10.5px}

.ward{display:flex;align-items:center;gap:10px;margin-top:11px;cursor:pointer}
.ward-dots{display:flex;gap:6px}
.wd{width:9px;height:9px;border-radius:50%;background:var(--bg2);border:1px solid var(--line)}
.wd.on{background:var(--brand);border-color:var(--brand)}
.ward-n{font-size:11.5px;color:var(--faint);font-weight:600;font-feature-settings:"tnum"}
.demo-hint{color:var(--brand);opacity:.55;font-style:normal}

.srcbox{border:1px solid var(--line);border-radius:14px;padding:11px 13px;margin:12px 0;cursor:pointer;background:var(--bg2)}
.srcbox-h{display:flex;align-items:center}
.srcbox-t{font-size:12px;color:var(--muted)}.srcbox-t b{color:var(--ink);font-weight:600}
.srcbox-chev{margin-left:auto;color:var(--faint);font-size:11px;transition:transform .3s}
.srcbox.open .srcbox-chev{transform:rotate(180deg)}
.srcbox-list{max-height:0;overflow:hidden;transition:max-height .35s ease,margin .3s,opacity .25s;opacity:0}
.srcbox.open .srcbox-list{max-height:400px;opacity:1;margin-top:11px}
.srcrow{display:flex;gap:9px;padding:7px 0;border-top:1px solid var(--line)}
.src-ico{width:24px;height:24px;border-radius:7px;display:flex;align-items:center;justify-content:center;font-size:12px;flex:0 0 24px}
.tier-study{background:#e7f0ff}.tier-guide{background:#e9f7ee}.tier-ref{background:#f0f0f2}
.src-tt{font-size:12px;font-weight:600;line-height:1.3}
.src-sub{font-size:10.5px;color:var(--faint);margin-top:2px}
.cite{color:var(--brand);font-weight:700;font-size:9px;vertical-align:super;cursor:pointer}

.trace{margin-top:11px;background:var(--bg2);border-radius:12px;padding:11px 13px}
.trace-h{font-size:12px;font-weight:600;color:var(--ink);margin-bottom:8px}
.trace-row{display:flex;gap:8px;font-size:12px;color:var(--faint);padding:3px 0;align-items:center}
.trace-mk{width:14px;text-align:center;flex:0 0 14px}
.trace-row.tdone{color:var(--muted)}.trace-row.tdone .trace-mk{color:var(--brand)}
.trace-row.tnow{color:var(--ink);font-weight:500}.trace-row.tnow .trace-mk{color:var(--brand);animation:spin 1.4s linear infinite;display:inline-block}
@keyframes spin{to{transform:rotate(360deg)}}

.tcard.slim{padding:13px 15px}
.slim-row{display:flex;align-items:center;gap:12px}
.slim-main{flex:1;min-width:0}
.slim-main .tc-tag{display:inline-block;margin-bottom:6px}
.slim-t{font-size:13.5px;font-weight:600;line-height:1.35;display:block}
.slim-btn{flex:0 0 auto;padding:9px 14px;align-self:center;min-width:0;width:auto}


/* hook cards: horizontal sliding window, unified size */

.hook-carousel{cursor:grab;display:flex;overflow-x:auto;scroll-snap-type:x mandatory;gap:14px;margin:0 0 8px;padding:4px 0 10px;scrollbar-width:none;-webkit-overflow-scrolling:touch}
.hook-carousel::-webkit-scrollbar{display:none}
.hook-slide{flex:0 0 100%;scroll-snap-align:center}
.hook-carousel.single{overflow:visible;padding:4px 0 10px;margin:0 0 8px}
.hook-carousel.single .hook-slide{flex:1 1 100%}
.hook-slide .tcard{min-height:170px;margin-bottom:0;display:flex;flex-direction:column}
.hook-slide .tc-actions{margin-top:auto}
.hook-dots{display:flex;justify-content:center;gap:6px;margin-bottom:14px}
.hd{width:6px;height:6px;border-radius:50%;background:var(--line);transition:background .2s,width .2s}
.hd.on{background:var(--brand);width:18px;border-radius:3px}

.tcard.slim.has-x{padding:14px 38px 14px 16px;position:relative}
.tcard.slim.has-x .slim-t{font-size:13.5px;font-weight:600;line-height:1.35;display:block}
.x-btn{position:absolute;top:50%;right:10px;transform:translateY(-50%);width:26px;height:26px;border:1.5px solid var(--brand-mid);background:#fff;color:var(--brand);border-radius:50%;font-size:15px;line-height:1;cursor:pointer;display:flex;align-items:center;justify-content:center;padding:0;font-family:inherit;transition:background .15s,border-color .15s}
.tcard.headsup .x-btn{border-color:var(--rose-mid);color:var(--rose)}
.tcard.headsup .x-btn:hover{background:var(--rose-soft);border-color:var(--rose)}
.tcard.battery .x-btn{border-color:var(--warm-mid);color:var(--warm)}
.tcard.battery .x-btn:hover{background:var(--warm-soft);border-color:var(--warm)}
.x-btn:hover{background:var(--brand-soft);border-color:var(--brand)}
.x-btn:active{transform:translateY(-50%) scale(.92)}

/* iOS-grouped slim rows */
.slim-group{background:#fff;border:1px solid var(--line);border-radius:var(--r-card);overflow:hidden;margin-bottom:14px;box-shadow:var(--shadow)}
.srow{display:flex;align-items:center;gap:12px;padding:13px 14px 13px 16px;position:relative;min-height:54px}
.srow + .srow{border-top:1px solid var(--line)}
.srow .slim-t{font-size:13.5px;font-weight:600;line-height:1.35;flex:1;min-width:0}
.srow .x-btn{position:static;transform:none;flex:0 0 26px}
.srow .x-btn:active{transform:scale(.92)}

.urgent-group{background:#fff;border:1px solid var(--rose-mid);border-radius:var(--r-card);overflow:hidden;margin-bottom:14px;box-shadow:var(--shadow)}
.urgent-group .srow{padding:14px 16px;min-height:54px}
.urgent-group .srow + .srow{border-top:1px solid var(--rose-soft)}
.urgent-group .srow .slim-t{font-size:13.5px;font-weight:600;line-height:1.35;flex:1;min-width:0}
.urgent-group .srow .x-btn{border-color:var(--rose-mid);color:var(--rose)}

.fab{position:absolute;left:18px;bottom:28px;width:44px;height:44px;border-radius:50%;background:var(--brand);color:#fff;border:none;line-height:1;display:flex;align-items:center;justify-content:center;cursor:pointer;box-shadow:0 2px 8px rgba(0,0,0,.12);z-index:55;transition:transform .15s,opacity .2s;font-family:inherit}
.fab:active{transform:scale(.92)}
.fab.hidden{opacity:0;pointer-events:none;transform:scale(.6)}
.asksheet{position:absolute;left:0;right:0;bottom:0;background:#fff;border-radius:22px 22px 0 0;box-shadow:0 -8px 28px rgba(0,0,0,.18);z-index:60;transform:translateY(100%);transition:transform .35s cubic-bezier(.32,.72,0,1);max-height:80%;display:flex;flex-direction:column}
.asksheet.open{transform:translateY(0)}
.ask-grab{width:36px;height:4px;background:var(--line);border-radius:2px;margin:8px auto 4px}
.ask-h{padding:12px 20px 6px;display:flex;align-items:center;gap:10px}
.ask-h .ask-t{font-size:15px;font-weight:700;flex:1}
.ask-h .ask-x{width:28px;height:28px;border:none;background:rgba(0,0,0,.04);color:var(--muted);border-radius:50%;font-size:18px;cursor:pointer;display:flex;align-items:center;justify-content:center;padding:0;font-family:inherit}
.ask-body{padding:6px 20px 20px;overflow-y:auto;flex:1}
.ask-prompt{font-size:13px;color:var(--muted);margin-bottom:10px;line-height:1.5}
.ask-input{width:100%;border:1px solid var(--line);border-radius:14px;padding:14px;font-family:inherit;font-size:14px;line-height:1.45;resize:none;min-height:90px;outline:none;transition:border-color .2s;box-sizing:border-box}
.ask-input:focus{border-color:var(--brand-mid)}
.ask-chips{display:flex;flex-direction:column;gap:8px;margin-top:10px}
.ask-chiplbl{font-size:12px;color:var(--muted);font-weight:600;margin-top:14px;margin-bottom:6px}
.ask-chiprow{display:flex;flex-wrap:wrap;gap:7px}
.ask-chip{padding:9px 14px;border:1.5px solid var(--line);background:#fff;color:var(--ink);border-radius:999px;font-family:inherit;font-size:13px;cursor:pointer;transition:all .15s}
.ask-chip.on{border-color:var(--brand);background:var(--brand-soft);color:var(--brand);font-weight:600}
.ask-recap{background:var(--bg2);border-radius:14px;padding:13px 14px;font-size:13px;line-height:1.55;margin:12px 0}
.ask-recap b{color:var(--brand);font-weight:600}
.ask-foot{display:flex;gap:10px;padding:0 20px 24px;border-top:none;margin-top:auto}
.ask-foot .cb{flex:1}
.ask-back{flex:0 0 auto !important;background:none !important;color:var(--muted) !important;padding:13px 6px !important}

.ask-bubble{background:var(--brand-soft);border:1px solid var(--brand-mid);border-radius:14px;padding:13px 14px;margin:12px 0}
.ask-bubble-l{font-size:11px;letter-spacing:.06em;text-transform:uppercase;font-weight:700;color:var(--brand);margin-bottom:6px}
.ask-bubble-t{font-size:13.5px;line-height:1.5;color:var(--ink)}
.fade{animation:fd .4s ease}@keyframes fd{from{opacity:0;transform:translateY(7px)}to{opacity:1;transform:none}}
</style>
</head>
<body>
<div class="phone">
  <div class="island"></div>
  <div class="statusbar"><span class="sb-t">19:06</span><span class="sb-r"><svg viewBox="0 0 20 14" class="sig"><rect x="0" y="9" width="3" height="5" rx="1"/><rect x="5" y="6" width="3" height="8" rx="1"/><rect x="10" y="3" width="3" height="11" rx="1"/><rect x="15" y="0" width="3" height="14" rx="1" opacity=".35"/></svg><svg viewBox="0 0 18 14" class="wifi"><path d="M9 12.5l.01 0M2 5.5a10 10 0 0 1 14 0M4.5 8a6.5 6.5 0 0 1 9 0M7 10.5a3 3 0 0 1 4 0" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/></svg><span class="batt"><span class="batt-b"><i style="width:74%"></i></span></span></span></div>
  <div class="hdr-bg"></div>
  <div class="hdr"><div id="hdrsub"></div><div class="avatar" onclick="openSettings()">J</div></div>
  <div class="body" id="body"></div>
  <div class="subpage" id="subpage"></div>
  <div class="home-ind"></div>
  <button id="fab" class="fab" onclick="openAsk()" aria-label="Ask Nana"><svg viewBox="0 0 24 24" width="22" height="22"><path d="M12 2 C12 8 16 12 22 12 C16 12 12 16 12 22 C12 16 8 12 2 12 C8 12 12 8 12 2 Z" fill="#fff"/></svg></button>
  <div id="asksheet" class="asksheet"></div>
  <div class="nav" id="nav"></div>
  <div class="toast" id="toast"></div>
</div>
<script>
var DATA={
  sarah:{name:'Sarah',emoji:'🐣',
    reports:[
      {id:'night',ico:'🌙',title:'Last Night',upd:'06:48',body:'9h 46m · woke once around 02:30 · settled night overall.',
        events:[{dot:'',t:'Asleep',s:'stillness onset',time:'21:02'},{dot:'',t:'Brief wake',s:'~8 min · back to sleep',time:'02:30'},{dot:'',t:'Awake',s:'motion onset',time:'06:48'}]},
      {id:'school',ico:'🏫',title:'School hours',upd:'14:25',body:'At school 07:52–14:25. Continuous activity detected twice during the day.',
        events:[{dot:'exit',t:'Left home',time:'07:35'},{dot:'safe',t:'At school',time:'07:52'},{dot:'activity',t:'Moderate Activity',intensity:'Moderate',peak:'steady movement, brief spikes',time:'09:35',end:'09:50',inZone:true},{dot:'activity',t:'Moderate Activity',intensity:'Moderate',peak:'steady movement',time:'11:20',end:'11:45',inZone:true},{dot:'exit',t:'Left school',time:'14:25'}]},
      {id:'evening',ico:'🌆',title:'Afternoon & Evening',upd:'21:02',body:'Aftercare 14:48–17:25, home 17:52. ~95 min outdoors today.',
        events:[{dot:'safe',t:'At aftercare',time:'14:48'},{dot:'activity',t:'Moderate Activity',intensity:'Moderate',peak:'long sustained stretch',time:'15:20',end:'16:30',inZone:true},{dot:'exit',t:'Left aftercare',time:'17:25'},{dot:'safe',t:'Home',time:'17:52'},{dot:'',t:'Winding down',s:'activity tapering',time:'20:30'},{dot:'',t:'Settled',s:'stillness onset · est. asleep',time:'21:02'}]}],
    cue:{q:'Sarah took a little detour after school today —<br>want her to show you?',ctx:'She stopped ~12 min at the little park by school — not on her usual way.',
      sigs:[['15:18','Left school','6 min later than usual'],['15:31','Little park','~12 min · new spot'],['15:58','Home','within safe range']],
      action:'Over dinner, ask Sarah to walk you through that little park — what did she spot there?',
      trayWhen:'At dinner',trayTxt:'Ask Sarah to show you the little park she found, and what she saw there.',archived:'“Have Sarah show you the little park”'},
    report:{title:'Night waking: Sarah’s picture',
      sources:[
        {tier:'study',t:'Sleep-onset latency in school-age children',src:'J. Pediatric Sleep · 2023',why:'informs the typical range'},
        {tier:'study',t:'Night waking patterns, ages 5–12',src:'Sleep Medicine Reviews · 2022',why:'frequency norms by age'},
        {tier:'guide',t:'Healthy Sleep Habits',src:'Am. Academy of Pediatrics',why:'what’s developmentally normal'},
        {tier:'ref',t:'Night waking — overview',src:'StatPearls',why:'general background'}
      ],
      norm:'A few brief night wakings per week sit within the <b>common range</b> for school-age kids; most settle back on their own.',
      mine:'Baseline ~<b>1/night</b>; last 7 days ~<b>2/night</b>, clustered 10pm–12am. <b>No</b> temperature or daytime-activity changes seen.',
      chart:[30,35,28,33,30,38,32,58,65,55,70,60,62,58],
      threshold:'If it <b>lasts beyond 2–3 weeks</b>, or comes with <b>clear daytime tiredness / fever / behavior change</b>, it’s worth seeing a professional.'},
    today:[
      {kind:'headsup',id:'s_signal',tag:'Heads-up',when:'14:42',t:'Sarah’s band lost signal between 14:30–14:42'},
      {kind:'question',id:'s_sleep',tag:'Worth a look',when:'this week',t:'Sarah’s been waking a little more this week',s:'~1 → ~2 times a night, mostly early. Want me to keep an eye and put it in context?'},
      {kind:'question',id:'s_sleep_2',tag:'Worth a look',when:'this week',t:'Sarah’s been waking a little more this week',s:'~1 → ~2 times a night, mostly early. Want me to keep an eye and put it in context?'},
      {kind:'ready',id:'s_daylight',tag:'Result ready',when:'today',t:'How active time relates to Sarah’s sleep — ready',s:'Typical range vs Sarah’s own 14 days. Sourced.'}
    ]},
  tommy:{name:'Tommy',emoji:'🧒',
    reports:[
      {id:'night',ico:'🌙',title:'Last Night',upd:'06:52',body:'Lights out 20:55, settled 21:23 — took ~28 min. 9h 29m settled.',
        events:[{dot:'',t:'Lights out',s:'motion declining',time:'20:55'},{dot:'',t:'Settled',s:'~28 min to settle · later than usual',time:'21:23'},{dot:'',t:'Awake',s:'motion onset',time:'06:52'}]},
      {id:'school',ico:'🏫',title:'School hours',upd:'15:40',body:'At school 07:55–15:40. Continuous activity detected, including a long high-intensity stretch in the afternoon.',
        events:[{dot:'exit',t:'Left home',time:'07:30'},{dot:'safe',t:'At school',time:'07:55'},{dot:'activity',t:'Light Activity',intensity:'Light',peak:'gentle movement',time:'09:40',end:'09:55',inZone:true},{dot:'activity',t:'Vigorous Activity',intensity:'Vigorous',peak:'high-intensity, likely running',time:'14:10',end:'14:35',inZone:true},{dot:'exit',t:'Left school',time:'15:40'},{dot:'safe',t:"At Grandma's",time:'16:20'},{dot:'exit',t:"Left Grandma's",time:'18:58'}]}
    ],
    cue:{q:'Tommy was really into the playground today —<br>want to go together this weekend?',ctx:'~25 min of running in the afternoon, noticeably more active than usual.',
      sigs:[['14:10','Playground','~25 min running'],['—','Intensity','above his usual afternoon'],['16:05','Home','within safe range']],
      action:'Ask Tommy what he played today, and whether he wants to go run at that spot together this weekend.',
      trayWhen:'This weekend',trayTxt:'Ask Tommy about the playground, and go run there together this weekend.',archived:'“Go to the playground together this weekend”'},
    report:{title:'Playground duration: Tommy’s picture',
      sources:[
        {tier:'study',t:'Physical activity intensity in children',src:'Pediatric Exercise Science · 2021',why:'what vigorous play looks like'},
        {tier:'guide',t:'Physical Activity Guidelines (6–17 y)',src:'WHO',why:'recommended daily activity'},
        {tier:'ref',t:'Childhood physical activity — overview',src:'StatPearls',why:'general background'}
      ],
      norm:'Sustained vigorous play in the afternoon is <b>common and healthy</b> for school-age kids.',
      mine:'About <b>25 min</b> of high-intensity movement on the playground today — in line with his active days.',
      chart:[20,22,18,24,20,48,52,55,50,46],
      threshold:'No concern on its own. Worth a look only if paired with <b>poor sleep or unusual fatigue</b> over several days.'},
    today:[
      {kind:'headsup',id:'t_late',tag:'Heads-up',when:'now',t:'Tommy hasn’t arrived home yet'},
      {kind:'battery',id:'t_batt',tag:'Battery',when:'18:40',t:'Tommy’s band is running low — 18%'},
      {kind:'needs',id:'t_info',tag:'Needs your input',when:'today',t:'Did Tommy’s after-school schedule change recently?',s:'Helps make sense of him taking longer to fall asleep.',answers:['Yes — later pickup','No change']},
      {kind:'question',id:'t_sleep',tag:'Worth a look',when:'last 7 days',t:'Taking a bit longer to fall asleep this week',s:'~12 → ~25 min, mostly after high-activity afternoons. Want a sourced look?'},
      {kind:'question',id:'t_sleep_2',tag:'Worth a look',when:'last 7 days',t:'Taking a bit longer to fall asleep this week',s:'~12 → ~25 min, mostly after high-activity afternoons. Want a sourced look?'}
    ]}
};
var ORDER=['sarah','tommy'];
var TRANSIT={tommy:{from:"Grandma's",to:'Home',since:'18:58',eta:'19:18',mins:12}};
/* Inbox = a single status-sorted stream. status drives structure; kid=chip; type=tag. */
/* Inbox = items the parent explicitly hooked. Everything else lives & dies on Today. */
var INBOX=[
  {id:'s_ready_inbox',kid:'sarah',type:'research',status:'active',substate:'ready',tag:'Result · ready to read',when:'today',
   t:'Night waking: Sarah’s picture',
   s:'A sourced look — the typical range next to Sarah’s own 14-day curve.',report:'sarah',open:false},
  {id:'s_watch_evening',kid:'sarah',type:'research',status:'active',substate:'progress',tag:'In progress',nights:[true,true,true,true,false],
   t:'Her evening rhythm',
   s:'Gathering a few more nights before saying anything — nothing for you to do.',progress:.55},
  {id:'t_watch_after',kid:'tommy',type:'research',status:'active',substate:'progress',tag:'In progress',nights:[true,true,false,false,false],
   t:'His afternoon energy pattern',
   s:'Comparing high-activity days vs others — Nana will surface it when ready.',progress:.7},
  {id:'t_kept_park',kid:'tommy',type:'research',status:'archive',tag:'Archived',when:'2 days ago',
   t:'Playground duration: Tommy’s picture',
   s:'Sourced look — kept for reference.',report:'tommy',open:false}
];
var VIEW={active:['active'],archive:['archive']};
var VIEWLBL=[['active','Active']];
/* Kept structured reports — personal center archive */
var ARCHIVE={
  sarah:[
    {id:'arch_s1',type:'keep',date:'May 27',title:'Evening outdoor light & sleep onset: Sarah\'s data',report:'sarah'},
    {id:'arch_s2',type:'stable',date:'May 24',title:'Night waking frequency: Sarah\'s data',report:'sarah'}
  ],
  tommy:[]
};
var S={child:'sarah',tab:'today',screen:'main',arcChild:'sarah',arcFilter:'all',arcOpen:{},transitOpen:false,askOpen:false,askStep:0,askText:'',askAnswers:[null,null,null],view:'active',open:{},cue:{sarah:'surfaced',tommy:'surfaced'},tray:{sarah:[],tommy:[]},todayDismissed:{},seen:false};
function arcCount(k){return ARCHIVE[k].length}
function pushArchive(kid,it,type){
  if(ARCHIVE[kid].some(function(x){return x.id===it.id}))return;
  ARCHIVE[kid].unshift({id:it.id,type:type,date:'Today',title:it.t,report:it.report||kid});
}
function $(id){return document.getElementById(id)}
function toast(m){var t=$('toast');t.textContent=m;t.classList.add('show');clearTimeout(t._t);t._t=setTimeout(function(){t.classList.remove('show')},1900)}
function cur(){return DATA[S.child]}
function chip(k){var d=DATA[k];return '<span class="chip '+k+'"><span class="ca">'+d.emoji+'</span>'+d.name+'</span>'}
function item(id){return INBOX.filter(function(x){return x.id===id})[0]}
function waitCount(){return INBOX.filter(function(x){return x.status==='active'}).length}
function renderHdr(){
  if(S.tab==='today'){$('hdrsub').className='kids';
    $('hdrsub').innerHTML=ORDER.map(function(k){var d=DATA[k],on=k===S.child;return '<div class="kid '+(on?'on':'')+'" onclick="setChild(\''+k+'\')"><div class="av">'+d.emoji+'</div><div class="nm">'+d.name+'</div></div>';}).join('');
  }else{$('hdrsub').className='kids';
    $('hdrsub').innerHTML=ORDER.map(function(k){var d=DATA[k],on=k===S.child;return '<div class="kid '+(on?'on':'')+'" onclick="setChild(\''+k+'\')"><div class="av">'+d.emoji+'</div><div class="nm">'+d.name+'</div></div>';}).join('');
    return;
    var _legacy='<div class="kids">'+VIEWLBL.map(function(v){var on=S.view===v[0];
      var n=v[0]==='active'?INBOX.filter(function(x){return x.status==='active'}).length:0;
      var cnt=n?'<span class="vcnt">'+n+'</span>':'';
      return '<div class="kid vkid '+(on?'on':'')+'" onclick="setView(\''+v[0]+'\')"><span class="nm">'+v[1]+'</span>'+cnt+'</div>';}).join('')+'</div>';}
}
function rowCls(t){var p=t.split(':'),m=+p[0]*60+(+p[1]);var top=(m>=340&&m<1143)?'d':'n';var bot=(m>340&&m<=1143)?'d':'n';return ' t-'+top+bot;}
function slimRow(it){
  if(it.kind==='headsup'||it.kind==='battery'){
    return '<div class="srow '+it.kind+'" data-tid="'+it.id+'"><span class="slim-t">'+it.t+'</span><button class="x-btn" aria-label="Dismiss" onclick="dismissToday(\''+it.id+'\')">×</button></div>';
  }
  if(it.kind==='ready'){
    return '<div class="srow ready" data-tid="'+it.id+'"><span class="slim-t">'+it.t+'</span><button class="x-btn arrow-btn" aria-label="Open" onclick="openReady(\''+it.id+'\')">→</button></div>';
  }
  return '';
}
function todayCard(d,it){
  if(it.kind==='cue'){
    var cs=S.cue[S.child],c=d.cue;
    if(cs==='accepted'||cs==='dismissed'){
      return '<div class="cue done"><div class="c-resolved"><div class="rd"></div><div><div class="rt">Nana offered an idea</div><div class="rs">'+c.archived+' · delivered</div></div></div></div>';
    }
    var open=cs==='open';
    return '<div class="cue"><div class="c-meta"><span class="bars"><i class="on"></i><i class="on"></i><i class="on"></i><i></i></span><span class="c-gen">Generated today · '+it.when+'</span><span class="c-tag">Cue</span></div><div class="c-q">'+c.q+'</div><div class="c-ctx">'+c.ctx+'</div>'+
      '<div class="c-act"><div class="l">Something to do together</div><div class="t">'+c.action+'</div></div><div class="cbtns"><button class="cb tint" onclick="cueAccept()">Save for later →</button><button class="cb gh" onclick="cueDismiss()">Not this time</button></div></div>';
  }
  if(it.kind==='transit'){
    return '<div class="tcard transit"><div class="tc-top"><span class="tc-tag" style="background:#fff;color:var(--brand);border:1px solid var(--brand-mid)">'+it.tag+'</span><span class="tc-when tc-live">live</span></div>'+
      '<div class="tc-t">'+it.t+'</div><div class="tc-s">'+it.s+'</div>'+
      '<div class="map"><svg viewBox="0 0 320 148" preserveAspectRatio="xMidYMid slice">'+
        '<line class="street" x1="-10" y1="40" x2="330" y2="58"/><line class="street" x1="60" y1="-10" x2="120" y2="160"/><line class="street" x1="200" y1="-10" x2="250" y2="160"/><line class="street" x1="-10" y1="110" x2="330" y2="98"/>'+
        '<path class="route" d="M44,118 C110,96 150,70 250,40"/>'+
        '<circle class="mk" cx="44" cy="118" r="5"/><text class="mlbl s" x="40" y="138">'+it.from+'</text>'+
        '<g transform="translate(250,40)"><path d="M0,-9 L9,0 L9,11 L-9,11 L-9,0 Z" class="mk"/></g><text class="mlbl" x="232" y="22">'+it.to+'</text>'+
        '<circle class="pulse" cx="186" cy="55"/><circle class="here" cx="186" cy="55" r="6"/>'+
      '</svg></div>'+
      '<div class="tc-eta"><div><b>ETA '+it.eta+'</b> <span>· ~12 min</span></div></div>'+
      '<button class="tc-track" onclick="toast(\'Live location · updates every ~30s while moving\')">View live location →</button></div>';
  }
  // ---- compact (slim) cards ----
  if(it.kind==='headsup'||it.kind==='battery'){
    return '<div class="tcard '+it.kind+' slim has-x" data-tid="'+it.id+'"><button class="x-btn" aria-label="Dismiss" onclick="dismissToday(\''+it.id+'\')">×</button><span class="slim-t">'+it.t+'</span></div>';
  }
  if(it.kind==='ready'){
    return '<div class="tcard ready slim has-x" data-tid="'+it.id+'"><button class="x-btn arrow-btn" aria-label="Open" onclick="openReady(\''+it.id+'\')">→</button><span class="slim-t">'+it.t+'</span></div>';
  }
  if(it.kind==='needs'){
    return '<div class="tcard needs" data-tid="'+it.id+'"><div class="tc-t">'+it.t+'</div><div class="tc-actions qa">'+it.answers.map(function(a,i){return '<button class="qachip" onclick="answerToday(\''+it.id+'\','+i+')">'+a+'</button>'}).join('')+'</div></div>';
  }
  if(it.kind==='question'){
    return '<div class="tcard question" data-tid="'+it.id+'"><div class="tc-t">'+it.t+'</div><div class="tc-s">'+it.s+'</div><div class="tc-actions"><button class="cb tint" onclick="keepAnEye(\''+it.id+'\')">Keep an eye on it →</button><button class="cb gh" onclick="dismissToday(\''+it.id+'\')">Not now</button></div></div>';
  }
  var h='<div class="tcard '+it.kind+'" data-tid="'+it.id+'"><div class="tc-top"><span class="tc-tag '+it.kind+'">'+it.tag+'</span><span class="tc-when">'+it.when+'</span></div>'+
    '<div class="tc-t">'+it.t+'</div><div class="tc-s">'+it.s+'</div>';
  if(it.kind==='watching'){
    h+='<div class="tc-prog"><i style="width:'+(it.progress*100)+'%"></i></div><div class="tc-progl">No action needed — Nana will surface it when ready.</div>';
  }
  return h+'</div>';
}
function syncHookDots(){var car=document.getElementById('hookcar');if(!car)return;var slides=car.querySelectorAll('.hook-slide');var dots=document.querySelectorAll('.hd');if(!dots.length)return;var w=car.clientWidth,i=Math.round(car.scrollLeft/w);dots.forEach(function(d,k){d.classList.toggle('on',k===i);});}
function setupHookCar(){
  var car=document.getElementById('hookcar');if(!car)return;
  car.addEventListener('scroll',syncHookDots,{passive:true});
  /* mouse drag-to-scroll */
  var down=false,startX=0,startL=0,moved=false;
  car.addEventListener('mousedown',function(e){down=true;moved=false;startX=e.pageX;startL=car.scrollLeft;car.style.cursor='grabbing';car.style.scrollSnapType='none';e.preventDefault();});
  window.addEventListener('mousemove',function(e){if(!down)return;var dx=e.pageX-startX;if(Math.abs(dx)>3)moved=true;car.scrollLeft=startL-dx;});
  window.addEventListener('mouseup',function(){if(!down)return;down=false;car.style.cursor='';car.style.scrollSnapType='x mandatory';/* snap to nearest */var w=car.clientWidth,i=Math.round(car.scrollLeft/w);car.scrollTo({left:i*w,behavior:'smooth'});});
  /* prevent click after drag */
  car.addEventListener('click',function(e){if(moved){e.preventDefault();e.stopPropagation();moved=false;}},true);
}

function renderToday(){
  var DOW=['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],MON=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];var nd=new Date();var dateStr=MON[nd.getMonth()]+' '+nd.getDate()+' · '+DOW[nd.getDay()];
  var d=cur(),h='<div class="today-h"><span class="today-t">Today</span><span class="today-d">'+dateStr+'</span></div>';
  var STACKABLE={cue:1,question:1};
  var flat=[],stack=[];
  d.today.forEach(function(it){
    if(S.todayDismissed[it.id])return;
    (STACKABLE[it.kind]?stack:flat).push(it);
  });
  /* group urgent slim cards (headsup + battery) into a single rose-accented container; other cards render individually */
  var URGENT_SLIM={headsup:1,battery:1};
  var grouped=flat.filter(function(it){return URGENT_SLIM[it.kind];});
  var rest=flat.filter(function(it){return !URGENT_SLIM[it.kind];});
  if(grouped.length>=2){
    h+='<div class="urgent-group">'+grouped.map(slimRow).join('')+'</div>';
    rest.forEach(function(it){h+=todayCard(d,it);});
  } else {
    flat.forEach(function(it){h+=todayCard(d,it);});
  }
  /* stack: big narrative cards as a banking-card pile */
  if(stack.length){
    h+='<div class="hook-carousel'+(stack.length===1?' single':'')+'" id="hookcar">';
    stack.forEach(function(it){h+='<div class="hook-slide">'+todayCard(d,it)+'</div>';});
    h+='</div>';
    if(stack.length>1){
      h+='<div class="hook-dots">';
      stack.forEach(function(_,i){h+='<span class="hd '+(i===0?'on':'')+'"></span>';});
      h+='</div>';
    }
  }
  if(S.tray[S.child].length){h+='<div class="sec-lbl">For later <span class="ct">· clears tonight</span></div>';
    S.tray[S.child].forEach(function(t){h+='<div class="tray"><div class="t-top"><span class="t-ico">🌙</span><span class="t-lbl">For later</span><span class="t-when">'+t.when+'</span></div><div class="t-txt">'+t.txt+'</div><div class="t-foot">Clears at end of day · no “done” button · whether you do it isn’t tracked</div></div>';});}
  h+='<div class="timeline">';
  var tr=TRANSIT[S.child];
  if(tr){
    h+='<div class="tl-row t-nn live-row" onclick="toggleTransit()">'+
       '<div class="livebar"><span class="lb-pulse"></span><span class="lb-txt">'+cur().name+' is out and moving</span><span class="lb-chev">›</span></div></div>';
    if(S.transitOpen){
      h+='<div class="tl-row t-nn"><span class="tl-dot"></span><div class="transit-card">'+
        '<div class="map"><svg viewBox="0 0 320 130" preserveAspectRatio="xMidYMid slice">'+
        '<line class="street" x1="-10" y1="38" x2="330" y2="54"/><line class="street" x1="60" y1="-10" x2="120" y2="142"/><line class="street" x1="205" y1="-10" x2="250" y2="142"/><line class="street" x1="-10" y1="100" x2="330" y2="90"/>'+
        '<path class="route" d="M40,104 C108,86 150,64 252,38"/>'+
        '<circle class="mk" cx="40" cy="104" r="5"/><text class="mlbl s" x="20" y="122">last: '+tr.from+'</text>'+
        
        '<circle class="pulse" cx="180" cy="52"/><circle class="here" cx="180" cy="52" r="6"/>'+
        '</svg></div>'+
        '<div class="tc-eta"><div><b>Moving</b> <span>· left '+tr.from+' at '+tr.since+' · not in a safe zone right now</span></div></div>'+
        '<button class="tc-track" onclick="event.stopPropagation();toast(\'Live location · updates every ~30s while moving\')">View live location →</button>'+
        '</div></div>';
    }
  }
  /* Merge reports + standalone zone events into a single desc-time list.
     Zone events surface on the rail (not buried in a card's expand). */
  var rows=[];
  /* collect all zone-like events across reports, sorted ascending */
  var allEvents=[];
  d.reports.forEach(function(r){
    rows.push({type:'report',time:r.upd,r:r});
    r.events.forEach(function(e){
      if(e.dot==='activity'&&e.inZone) return;
      if(e.dot==='safe'||e.dot==='exit'||e.dot==='activity'||e.dot==='dev') allEvents.push(e);
    });
  });
  allEvents.sort(function(a,b){return a.time.localeCompare(b.time);});
  /* pair safe→exit for same place; merge only if a later safe event follows (stay complete) */
  var skip={};
  allEvents.forEach(function(e,i){
    if(e.dot!=='safe') return;
    var place=e.t.replace(/^At /,'');
    for(var j=i+1;j<allEvents.length;j++){
      var x=allEvents[j];
      if(x.dot==='exit' && x.t==='Left '+place){
        var returned=false;
        for(var k=j+1;k<allEvents.length;k++){ if(allEvents[k].dot==='safe'){returned=true;break;} }
        if(returned){
          /* synthesize a merged event using safe + end time */
          rows.push({type:'zone',time:e.time,e:{dot:'safe',t:'At '+place,time:e.time,end:x.time}});
          skip[i]=true;skip[j]=true;
        }
        break;
      }
    }
  });
  allEvents.forEach(function(e,i){ if(!skip[i]) rows.push({type:'zone',time:e.time,e:e}); });
  rows.sort(function(a,b){return b.time.localeCompare(a.time);});
  rows.forEach(function(row){
    if(row.type==='sun'){
      h+='<div class="tl-row'+rowCls(row.time)+'"><span class="tl-dot"></span><div class="tl-zone"><span class="zt">'+row.time+'</span><span class="zl">'+row.t+'</span></div></div>';
      return;
    }
    if(row.type==='zone'){
      var e=row.e;var tmStr=e.end?('<span class="zts">'+e.time+'</span><span class="zline"></span><span class="zte">'+e.end+'</span>'):e.time;
      if(e.dot==='activity'){
        var aid='act-'+e.time.replace(':',''),aop=S.open[aid];
        h+='<div class="tl-row'+rowCls(e.time)+'"><span class="tl-dot"></span><div class="tl-zone act '+(aop?'open':'')+'" onclick="toggleReport(\''+aid+'\')"><div class="az-head"><span class="zt">'+tmStr+'</span><span class="zl">'+e.t+'</span><span class="zchev">▾</span></div><div class="az-exp"><div class="az-row"><span>Intensity</span><b>'+e.intensity+'</b></div><div class="az-row"><span>Pattern</span><b>'+e.peak+'</b></div><div class="az-note">From motion only — Nana reads how much movement, not what kind of exercise.</div></div></div></div>';
      } else {
        h+='<div class="tl-row'+rowCls(e.time)+'"><span class="tl-dot"></span><div class="tl-zone"><span class="zt">'+tmStr+'</span><span class="zl">'+e.t+'</span>'+(e.s?'<span class="zs">'+e.s+'</span>':'')+'</div></div>';
      }
    } else {
      var r=row.r,oid=S.child+'-'+r.id,op=S.open[oid];
      var nonZone=r.events.filter(function(e){return (e.dot==='activity'&&e.inZone)||(e.dot!=='safe'&&e.dot!=='exit'&&e.dot!=='activity'&&e.dot!=='dev')});
      h+='<div class="tl-row'+rowCls(r.upd)+'"><span class="tl-dot"></span>'+
        '<div class="report '+(op?'open':'')+'" onclick="toggleReport(\''+oid+'\')"><div class="r-top"><span class="r-title">'+r.title+'</span><span class="r-time">Updated '+r.upd+' <span class="r-chev">▾</span></span></div><div class="r-body">'+r.body+'</div><div class="r-detail">'+
        nonZone.slice().reverse().map(function(e){return '<div class="event"><span class="ev-time">'+e.time+'</span><span class="ev-text">'+e.t+(e.s?' <span class="es">· '+e.s+'</span>':'')+'</span></div>';}).join('')+'</div></div></div>';
    }
  });
  h+='</div>';
  $('body').innerHTML='<div class="pad fade">'+h+'</div>';
  setupHookCar();
}
var TIER={study:['📄','study','tier-study'],guide:['📘','guideline','tier-guide'],ref:['🌐','reference','tier-ref']};
function srcCount(src){var c={study:0,guide:0,ref:0};src.forEach(function(x){c[x.tier]++;});var p=[];if(c.study)p.push(c.study+' '+(c.study>1?'studies':'study'));if(c.guide)p.push(c.guide+' guideline'+(c.guide>1?'s':''));if(c.ref)p.push(c.ref+' reference'+(c.ref>1?'s':''));return p.join(' · ');}
function reportBlock(k){var w=DATA[k].report,mx=Math.max.apply(null,w.chart);var src=w.sources||[];
  var srcBlock=src.length?'<div class="srcbox" onclick="event.stopPropagation();this.classList.toggle(\'open\')"><div class="srcbox-h"><span class="srcbox-t">Based on <b>'+srcCount(src)+'</b></span><span class="srcbox-chev">▾</span></div><div class="srcbox-list">'+
      src.map(function(x){var t=TIER[x.tier];return '<div class="srcrow"><span class="src-ico '+t[2]+'">'+t[0]+'</span><div class="src-meta"><div class="src-tt">'+x.t+'</div><div class="src-sub">'+x.src+' — '+x.why+'</div></div></div>';}).join('')+'</div></div>':'';
  return '<div class="moat">🔎 <div><b>Why this beats just asking an AI:</b> holds the published literature <b>and '+DATA[k].name+'’s own longitudinal curve — which only Nana has</b>.</div></div>'+
    srcBlock+
    '<div class="blk"><div class="b-lbl">📚 What’s typical</div><div class="b-txt">'+w.norm+' <sup class="cite">1</sup></div></div>'+
    '<div class="blk"><div class="b-lbl">📈 '+DATA[k].name+'’s recent picture</div><div class="b-txt">'+w.mine+'</div><div class="bchart">'+w.chart.map(function(v,i){var hi=i>=Math.floor(w.chart.length/2);return '<div class="bar '+(hi?'hi':'')+'" style="height:'+(v/mx*100)+'%"></div>'}).join('')+'</div><div class="nl">— blue = earlier baseline · amber = recent —</div></div>'+
    '<div class="route"><div class="b-lbl">⚠️ When it’s worth asking a doctor</div><div class="b-txt">'+w.threshold+' Nana doesn’t make the call.</div><button class="rbtn" onclick="event.stopPropagation();routeDoc()">📋 Prepare a summary for the doctor →</button></div>'+
    '<div class="disc">This is context, not advice. Whether to act, and how, is yours to decide.</div>';
}
function itemCard(it){
  var cls=it.status==='archive'?'kept':(it.substate||'ready');
  var h='<div class="item '+cls+' '+(it.open?'open':'')+'" id="it-'+it.id+'">'+
    '<div class="it-t">'+it.t+'</div><div class="it-s">'+it.s+'</div>';
  if(it.status==='active'&&it.substate==='ready'){
    h+='<div class="it-actions"><button class="ibtn teal" onclick="toggleItem(\''+it.id+'\')">'+(it.open?'Hide':'Open the look')+' '+(it.open?'▲':'→')+'</button></div>'+
       '<div class="rep-exp">'+reportBlock(it.report)+'<button class="ibtn teal" style="width:100%" onclick="keep(\''+it.id+'\')">Keep this →</button></div>';
  }else if(it.status==='active'&&it.substate==='waiting'){
    h+='<div class="it-actions qa">'+it.answers.map(function(a,i){return '<button class="qachip" onclick="answer(\''+it.id+'\','+i+')">'+a+'</button>'}).join('')+'</div>';
  }else if(it.status==='active'&&it.substate==='progress'){
    if(it.nights){var done=it.nights.filter(function(x){return x;}).length,tot=it.nights.length;
      h+='<div class="ward" onclick="advanceWard(\''+it.id+'\')"><div class="ward-dots">'+it.nights.map(function(n){return '<span class="wd '+(n?'on':'')+'"></span>';}).join('')+'</div><span class="ward-n">'+done+' of '+tot+' nights</span></div><div class="prog-l">Watching the next few nights — pattern or just a blip? Nothing for you to do.<span class="demo-hint"> (demo: tap dots to advance)</span></div>';
    }else if(it.trace){
      h+='<div class="trace"><div class="trace-h">🔍 Looking into this…</div>'+
        it.trace.map(function(tr){return '<div class="trace-row '+(tr[0]==='done'?'tdone':tr[0]==='now'?'tnow':'')+'"><span class="trace-mk">'+(tr[0]==='done'?'✓':tr[0]==='now'?'⟳':'○')+'</span>'+tr[1]+'</div>';}).join('')+
        '</div><div class="prog-l">No action needed — Nana will surface a sourced look when ready.</div>';
    }else{
      h+='<div class="prog"><i style="width:'+((it.progress||.3)*100)+'%"></i></div><div class="prog-l">No action needed — Nana will surface it when ready.</div>';
    }
  }else if(it.status==='archive'){
    if(it.report){
      h+='<div class="it-foot" style="color:var(--faint);font-size:11.5px;font-style:italic">Kept for reference · reopen anytime</div>'+
         '<div class="it-actions"><button class="ibtn gh" onclick="toggleItem(\''+it.id+'\')">'+(it.open?'Hide':'Reopen')+'</button></div>'+
         '<div class="rep-exp">'+reportBlock(it.report)+'</div>';
    } else {
      h+='<div class="it-foot" style="color:var(--faint);font-size:11.5px;font-style:italic">Settled on its own · kept for reference</div>';
    }
  }
  return h+'</div>';
}
function renderInbox(){
  S.seen=true;var h='';
  if(S.view==='active'){
    var act=INBOX.filter(function(x){return x.status==='active'});
    var needs=act.filter(function(x){return x.substate!=='progress'});
    var prog=act.filter(function(x){return x.substate==='progress'});
    if(needs.length){h+='<div class="ib-sec">Needs you</div>';needs.forEach(function(it){h+=itemCard(it);});}
    if(prog.length){h+='<div class="ib-sec ib-sec-quiet">In progress <span class="ib-note">· Nana is watching, nothing for you to do</span></div>';prog.forEach(function(it){h+=itemCard(it);});}
    if(!act.length) h='<div class="empty"><div class="ei">📥</div>Nothing here right now. Hook something from Today to start tracking it.</div>';
  } else {
    var rows=INBOX.filter(function(x){return x.status==='archive'});
    if(rows.length){rows.forEach(function(it){h+=itemCard(it);});}
    else h='<div class="empty"><div class="ei">📥</div>Nothing kept yet. When you Keep an active item, it lands here.</div>';
  }
  $('body').innerHTML='<div class="pad fade">'+h+'</div>';
}
function renderNav(){
  var wc=waitCount();
  var items=[['today','🏠','Today'],['inbox','🫶','Care']];
  var ICON={today:'<svg viewBox="0 0 24 24"><path d="M3 9.5L12 3l9 6.5V20a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z"/></svg>',inbox:'<svg viewBox="0 0 24 24"><path d="M12 21l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21z"/></svg>'};
  $('nav').innerHTML='<div class="nav-pill">'+items.map(function(it){var on=S.tab===it[0];
    var badge=(it[0]==='inbox'&&wc&&!S.seen)?'<span class="cntbadge">'+wc+'</span>':'';
    return '<div class="navi '+(on?'on':'')+'" data-tab="'+it[0]+'" onclick="setTab(\''+it[0]+'\')">'+ICON[it[0]]+'<span class="nt">'+it[2]+'</span>'+badge+'</div>';}).join('')+'</div>';
}
function renderFab(){var fab=document.getElementById('fab');if(!fab)return;fab.classList.toggle('hidden',S.tab!=='inbox');}
var DEMO_Q={sarah:"Why has Sarah been waking up more at night lately?",tommy:"Has Tommy been getting enough rest this week?"};
var DEMO_UNDERSTAND={
  sarah:"You're asking about Sarah's recent sleep stability — specifically how often she's waking at night, and whether it's drifting from her usual pattern.",
  tommy:"You're asking whether Tommy's total sleep and sleep quality this week match what's typical for him, and whether he's recovering enough between active days."
};
var DEMO_STRATEGY={
  sarah:"I'll look at Sarah's nightly wake count and sleep onset, compared to her own baseline. I'll cross-check with pediatric sleep literature on night waking in school-age children.",
  tommy:"I'll look at Tommy's total sleep duration, onset, and night wakings across the week, compared to his own baseline. I'll cross-check with pediatric guidance on sleep for active kids."
};
function openAsk(){S.askOpen=true;S.askStep=0;S.askText=DEMO_Q[S.child]||'';S.askAnswers=[null,null];render();setTimeout(function(){var t=document.getElementById('askinput');if(t){t.focus();t.setSelectionRange(t.value.length,t.value.length);}},350);}
function closeAsk(){S.askOpen=false;render();}
function askNext(){
  if(S.askStep===0){var t=document.getElementById('askinput');if(!t||!t.value.trim())return;S.askText=t.value.trim();S.askStep=1;}
  else if(S.askStep===1){S.askStep=2;}
  else if(S.askStep===2){S.askStep=3;}
  else if(S.askStep===3){if(S.askAnswers.some(function(x){return x===null;}))return;startResearchFromAsk();}
  render();
}
function askBack(){if(S.askStep>0){S.askStep--;render();}}
function askPick(idx,val){S.askAnswers[idx]=val;render();}
function startResearchFromAsk(){
  var subj=S.child,name=DATA[subj].name;
  var period=['the past week','the past month','the past 3 months'][S.askAnswers[0]]||'recent days';
  var observe=S.askAnswers[1]===1;
  var item={id:'ask_'+Date.now(),kid:subj,type:'research',status:'active',substate:'progress',tag:'In progress',
    t:S.askText,
    s:observe?('Looking at '+period+' + watching forward.'):('Looking at '+period+'.'),
    trace:[['done','Scoping the question'],['done','Pediatric literature'],['now','Comparing with '+name+'’s pattern']]};
  if(observe) item.nights=[true,false,false,false,false];
  INBOX.unshift(item);
  S.askOpen=false;render();toast(observe?'Researching + observing · added to Care':'Researching · added to Care');
}
function renderAsk(){var sh=document.getElementById('asksheet');if(!sh)return;sh.classList.toggle('open',S.askOpen);if(!S.askOpen){sh.innerHTML='';return;}
  var name=DATA[S.child].name;
  var html='<div class="ask-grab"></div><div class="ask-h"><div class="ask-t">Ask Nana</div><button class="ask-x" onclick="closeAsk()">×</button></div><div class="ask-body">';
  if(S.askStep===0){
    html+='<div class="ask-prompt">What would you like to understand about '+name+'? A rough question is fine — I’ll work with you to make sense of it.</div>'+
      '<textarea id="askinput" class="ask-input" placeholder="e.g., Is '+name+' sleeping well lately?">'+S.askText+'</textarea>';
  } else if(S.askStep===1){
    html+='<div class="ask-recap">You asked: <b>“'+S.askText+'”</b></div>'+
      '<div class="ask-bubble"><div class="ask-bubble-l">Here’s what I’m hearing</div><div class="ask-bubble-t">'+(DEMO_UNDERSTAND[S.child]||'I’m interpreting your question as asking about '+name+'’s recent patterns.')+'</div></div>'+
      '<div class="ask-prompt">Does that match what you meant?</div>';
  } else if(S.askStep===2){
    html+='<div class="ask-bubble"><div class="ask-bubble-l">Here’s how I’d look at it</div><div class="ask-bubble-t">'+(DEMO_STRATEGY[S.child]||'I’ll compare recent patterns with '+name+'’s own baseline, and cross-check with pediatric literature.')+'</div></div>'+
      '<div class="ask-prompt">Sound right?</div>';
  } else {
    html+='<div class="ask-chiplbl" style="margin-top:0">Over what time</div><div class="ask-chiprow">'+
      ['Past week','Past month','Past 3 months'].map(function(o,i){return '<button class="ask-chip '+(S.askAnswers[0]===i?'on':'')+'" onclick="askPick(0,'+i+')">'+o+'</button>';}).join('')+'</div>'+
      '<div class="ask-chiplbl">Watch forward too?</div><div class="ask-chiprow">'+
      [['No, just look at what’s there','No'],['Yes, also watch the next few nights','Yes']].map(function(o,i){return '<button class="ask-chip '+(S.askAnswers[1]===i?'on':'')+'" onclick="askPick(1,'+i+')">'+o[0]+'</button>';}).join('')+'</div>';
  }
  html+='</div><div class="ask-foot">';
  if(S.askStep>0) html+='<button class="cb ask-back" onclick="askBack()">‹ Back</button>';
  var canNext;
  if(S.askStep===0) canNext=true;
  else if(S.askStep===3) canNext=S.askAnswers.every(function(x){return x!==null;});
  else canNext=true;
  var label;
  if(S.askStep===0) label='Send';
  else if(S.askStep===1) label='Yes, that’s right';
  else if(S.askStep===2) label='Sounds good';
  else label='Start research →';
  html+='<button class="cb pri" onclick="askNext()" '+(canNext?'':'disabled')+'>'+label+'</button></div>';
  sh.innerHTML=html;
}
function pgBack(btn){
  return '<button class="pg-back" onclick="'+btn+'" aria-label="Back">‹</button>';
}
function renderSettings(){
  var n=ORDER.reduce(function(s,k){return s+arcCount(k)},0);
  var h='<div class="pg-hdr">'+pgBack('closeSettings()')+'<div class="pg-title">Settings</div></div>'+
    '<div class="body"><div class="pad fade">'+
    '<div class="pg-prof" onclick="toast(\'Account profile\')"><div class="pg-av">J</div><div><div class="pg-name">Alex Chen</div><div class="pg-meta">alex@example.com · Pro member</div></div><span class="sh-chev">›</span></div>'+
    '<div class="pg-kids"><div class="pg-klbl">Children</div><div class="pg-krow">'+
    ORDER.map(function(k){var d=DATA[k];return '<div class="pg-kid" onclick="toast(\'Manage '+d.name+'\')"><div class="pg-kav">'+d.emoji+'</div><span class="pg-knm">'+d.name+'</span></div>';}).join('')+
    '<div class="pg-kadd" onclick="toast(\'Add a child\')">+</div></div></div>'+
    '<div class="sh-sec">Archive</div><div class="sh-card">'+
    '<div class="sh-row" onclick="openArchive()"><div class="sh-ico r"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><path d="M14 2v6h6"/><path d="M9 13h6"/><path d="M9 17h4"/></svg></div><div class="sh-body"><div class="sh-rt">Archive</div><div class="sh-rs">Kept &amp; self-stabilized structured reports · '+n+' saved</div></div><span class="sh-chev">›</span></div></div>'+
    '<div class="sh-sec">Notifications &amp; preferences</div><div class="sh-card">'+
    '<div class="sh-row" onclick="toast(\'Set quiet hours &amp; alert types\')"><div class="sh-ico n"><svg viewBox="0 0 24 24"><path d="M6 17h12l-1.5-2V11a4.5 4.5 0 0 0-9 0v4z"/><path d="M10 20a2 2 0 0 0 4 0"/></svg></div><div class="sh-body"><div class="sh-rt">Notification settings</div><div class="sh-rs">Summary, alerts, device status</div></div><span class="sh-chev">›</span></div>'+
    '<div class="sh-row" onclick="toast(\'Language\')"><div class="sh-ico" style="color:var(--muted)"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="M2 12h20"/><path d="M12 2a15 15 0 0 1 4 20 15 15 0 0 1-8 0 15 15 0 0 1 4-20"/></svg></div><div class="sh-body"><div class="sh-rt">Language</div><div class="sh-rs">App display language</div></div><span class="sh-val">English</span><span class="sh-chev">›</span></div></div>'+
    '<div class="sh-sec">Family &amp; devices</div><div class="sh-card">'+
    '<div class="sh-row" onclick="toast(\'Manage Sarah &amp; Tommy\')"><div class="sh-ico k"><svg viewBox="0 0 24 24"><circle cx="9" cy="8" r="3.2"/><circle cx="17" cy="9" r="2.6"/><path d="M3 19c.6-3.4 3-5 6-5s5.4 1.6 6 5"/><path d="M14.5 18c.4-2 1.7-3.4 3.5-3.4 2 0 3.3 1.4 3.7 3.4"/></svg></div><div class="sh-body"><div class="sh-rt">Kids</div><div class="sh-rs">Sarah, Tommy · add or invite a guardian</div></div><span class="sh-chev">›</span></div>'+
    '<div class="sh-row" onclick="toast(\'Manage bands &amp; pairing\')"><div class="sh-ico d"><svg viewBox="0 0 24 24"><rect x="8" y="3" width="8" height="18" rx="2.5"/><circle cx="12" cy="17" r="1"/></svg></div><div class="sh-body"><div class="sh-rt">Devices</div><div class="sh-rs">2 bands paired · battery, fit, firmware</div></div><span class="sh-chev">›</span></div></div>'+
    '<div class="sh-sec">Privacy &amp; data</div><div class="sh-card">'+
    '<div class="sh-row" onclick="toast(\'Review consents &amp; data\')"><div class="sh-ico p"><svg viewBox="0 0 24 24"><path d="M12 3l8 3v6c0 5-3.5 8.5-8 9-4.5-.5-8-4-8-9V6z"/></svg></div><div class="sh-body"><div class="sh-rt">Privacy &amp; Data</div><div class="sh-rs">Co-guardian, export, delete</div></div><span class="sh-chev">›</span></div>'+
    '<div class="sh-row" onclick="toast(\'Data region\')"><div class="sh-ico" style="color:var(--muted)"><svg viewBox="0 0 24 24"><ellipse cx="12" cy="12" rx="10" ry="10"/><path d="M2 12h20"/><path d="M12 2a15 15 0 0 1 0 20 15 15 0 0 1 0-20"/></svg></div><div class="sh-body"><div class="sh-rt">Data region</div><div class="sh-rs">Where your family data is stored</div></div><span class="sh-val">Singapore</span><span class="sh-chev">›</span></div></div>'+
    '<div class="sh-sec">About</div><div class="sh-card">'+
    '<div class="sh-row" onclick="toast(\'Nana 0.9.4 · build 184\')"><div class="sh-ico a"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="M12 8v5"/><circle cx="12" cy="16.5" r=".5" fill="currentColor"/></svg></div><div class="sh-body"><div class="sh-rt">About</div><div class="sh-rs">Version, help, legal</div></div><span class="sh-chev">›</span></div></div>'+
    '<div class="sh-foot">Nana · Stay in tune with your child.</div></div></div>';
  $('subpage').innerHTML=h;$('subpage').className='subpage on';
}
function renderArchive(){
  var k=S.arcChild,rows=ARCHIVE[k].slice();
  if(S.arcFilter==='keep')rows=rows.filter(function(x){return x.type==='keep'});
  else if(S.arcFilter==='stable')rows=rows.filter(function(x){return x.type==='stable'});
  var nK=ARCHIVE[k].filter(function(x){return x.type==='keep'}).length;
  var nS=ARCHIVE[k].filter(function(x){return x.type==='stable'}).length;
  var h='<div class="pg-hdr">'+pgBack('closeArchive()')+'<div class="pg-title">Archive</div></div>'+
    '<div class="body"><div class="pad fade">'+
    '<div class="arc-lbl">Sourced reports · by child</div><div class="arc-kids">'+
    ORDER.map(function(cid){var d=DATA[cid],on=cid===k,cnt=arcCount(cid);
      return '<div class="arc-kid '+(on?'on':'')+'" onclick="setArcChild(\''+cid+'\')"><div class="av">'+d.emoji+'</div><span class="nm">'+d.name+'</span><span class="cnt">'+cnt+'</span></div>';
    }).join('')+'</div>'+
    '<div class="arc-lbl" style="text-transform:none;letter-spacing:0">Filter</div><div class="arc-flt">'+
    [['all','All · '+ARCHIVE[k].length],['keep','Kept · '+nK],['stable','Self-stabilized · '+nS]].map(function(f){
      return '<button class="arc-chip '+(S.arcFilter===f[0]?'on':'')+'" onclick="setArcFilter(\''+f[0]+'\')">'+f[1]+'</button>';
    }).join('')+'</div>'+
    '<div class="arc-hint">Kept = saved by you · Self-stabilized = archived after pattern settled</div>'+
    '<div class="arc-sum">'+rows.length+' item'+(rows.length===1?'':'s')+' · newest first</div>';
  if(!rows.length)h+='<div class="empty"><div class="ei">📄</div>Nothing archived yet. Keep a structured report from Care, or wait for an observation to self-stabilize.</div>';
  else rows.forEach(function(r){
    var op=S.arcOpen[r.id],tag=r.type==='keep'?'Kept':'Self-stabilized';
    h+='<div class="arc-card '+(op?'open':'')+'" onclick="toggleArc(\''+r.id+'\')"><div class="arc-top"><span class="arc-tag '+(r.type==='keep'?'keep':'stable')+'">'+tag+'</span><span class="arc-date">'+r.date+'</span></div>'+
      '<div class="arc-t">'+r.title+'<span class="arc-chev">▾</span></div>'+
      (r.report?'<div class="arc-exp" onclick="event.stopPropagation()">'+reportBlock(r.report)+'</div>':'')+
      '</div>';
  });
  h+='</div></div>';
  $('subpage').innerHTML=h;$('subpage').className='subpage on';
}
function renderSub(){
  var sp=$('subpage'),phone=document.querySelector('.phone');
  if(S.screen==='main'){sp.className='subpage';sp.innerHTML='';if(phone)phone.classList.remove('sub');return;}
  if(phone)phone.classList.add('sub');
  if(S.screen==='settings')renderSettings();
  else if(S.screen==='archive')renderArchive();
}
function render(){renderSub();if(S.screen!=='main')return;renderHdr();renderNav();if(S.tab==='today'){renderToday();setupHookCar();}else renderInbox();renderFab();renderAsk();}

function openSettings(){S.screen='settings';S.askOpen=false;render();}
function closeSettings(){S.screen='main';render();}
function openArchive(){S.screen='archive';S.arcChild=S.arcChild||'sarah';render();}
function closeArchive(){S.screen='settings';render();}
function setArcChild(k){S.arcChild=k;S.arcFilter='all';renderArchive();}
function setArcFilter(f){S.arcFilter=f;renderArchive();}
function toggleArc(id){S.arcOpen[id]=!S.arcOpen[id];renderArchive();}
function toggleTransit(){S.transitOpen=!S.transitOpen;renderToday();}
function setChild(k){S.transitOpen=false;S.child=k;render();}
function setTab(t){S.tab=t;render();}
function setView(v){S.view=v;render();}
function toggleReport(id){S.open[id]=!S.open[id];renderToday();}
function animateOut(id,toInbox,cb){
  var card=document.querySelector('[data-tid="'+id+'"]');
  if(!card){cb();return;}
  card.classList.add('leaving');
  if(toInbox){var nv=document.querySelector('.navi[data-tab="inbox"]');if(nv){nv.classList.add('pop');setTimeout(function(){nv.classList.remove('pop');},450);}}
  setTimeout(cb,260);
}
function cueAccept(){var c=cur().cue;var el=document.querySelector('.cue');if(el)el.classList.add('leaving');setTimeout(function(){S.tray[S.child].push({when:c.trayWhen,txt:c.trayTxt});S.cue[S.child]='accepted';toast('Saved for later');renderToday();},260);}
function cueDismiss(){var c=document.querySelector('.cue');if(c)c.classList.add('leaving');setTimeout(function(){S.cue[S.child]='dismissed';toast('Okay — skipping this one');renderToday();},260);}
function dismissToday(id){animateOut(id,false,function(){S.todayDismissed[id]=true;toast('Cleared from Today');renderToday();});}
function answerToday(id,i){
  var d=cur(),it=d.today.filter(function(x){return x.id===id})[0];
  /* hooks into Inbox as active/progress */
  INBOX.unshift({id:'hooked_'+id,kid:S.child,type:'research',status:'active',substate:'progress',tag:'In progress · with your note',when:'now',t:'Looking into '+it.t.toLowerCase(),s:'Researching with your note.',trace:[['done','Pediatric norms for this'],['now','Cross-checking guidelines'],['todo','Comparing with '+cur().name+'’s pattern']]});
  animateOut(id,true,function(){S.todayDismissed[id]=true;toast('Now in Care · researching');renderToday();});
}
function hookToInbox(id){
  var d=cur(),it=d.today.filter(function(x){return x.id===id})[0];
  INBOX.unshift({id:'hooked_'+id,kid:S.child,type:'research',status:'active',substate:'progress',tag:'In progress',when:'now',t:it.t,s:'Researching now.',trace:[['done','Pediatric norms for this'],['done','Clinical guidelines'],['now','Comparing with '+cur().name+'’s own pattern']]});
  animateOut(id,true,function(){S.todayDismissed[id]=true;toast('Added to Care');renderToday();});
}
function keepAnEye(id){
  var d=cur(),it=d.today.filter(function(x){return x.id===id})[0];
  /* trigger → Inbox closed loop: plant a multi-day observation ward */
  INBOX.unshift({id:'ward_'+id,kid:S.child,type:'research',status:'active',substate:'progress',tag:'In progress',
    t:'Keeping an eye on '+(it.t.toLowerCase().indexOf('wak')>=0?'her evening rhythm':'this'),
    s:'Watching the next few nights.',nights:[true,false,false,false,false]});
  animateOut(id,true,function(){S.todayDismissed[id]=true;toast('Now watching · added to Care');renderToday();});
}
function openReady(id){
  /* the ready-on-Today is a result of an earlier hooked item. Open the demo report block inline-light, or jump to Inbox. We add it as a ready item in Inbox and switch. */
  var d=cur(),it=d.today.filter(function(x){return x.id===id})[0];
  if(!INBOX.some(function(x){return x.id==='hooked_'+id})){
    INBOX.unshift({id:'hooked_'+id,kid:S.child,type:'research',status:'active',substate:'ready',tag:'Result · ready to read',when:'today',t:it.t,s:'A sourced look — ready when you are.',report:S.child,open:false});
  }
  S.todayDismissed[id]=true;S.tab='inbox';S.view='active';toast('Opening in Care');render();
}
function advanceWard(id){
  var it=item(id); if(!it||!it.nights) return;
  var i=it.nights.indexOf(false);
  if(i>=0){ it.nights[i]=true; renderInbox(); return; }
  /* window complete → decide terminal. s_watch_evening = pattern held (→ ready); others = dissolved */
  if(id==='s_watch_evening'||/wak|evening/.test(it.t.toLowerCase())){
    it.substate='ready'; it.tag='Result · ready to read'; it.t='Night waking: Sarah’s picture';
    it.s='The pattern held over the week — here’s a sourced look.'; it.report='sarah'; it.open=false; delete it.nights;
    toast('Pattern held — a sourced look is ready');
  }else{
    it.status='archive'; it.tag='Settled on its own'; it.s='Back to usual after a few nights — nothing stood out. Kept for reference.';
    it.open=false; delete it.nights; delete it.substate;
    pushArchive(it.kid,it,'stable');
    toast('Settled on its own — moved to Archive');
  }
  render();
}
function toggleItem(id){var it=item(id);it.open=!it.open;renderInbox();}
function answer(id,i){var it=item(id);it.substate='progress';it.tag='In progress';it.when='now';it.t='Looking into it with your note';it.s='Researching with the context you gave — Nana will surface a result when ready.';it.progress=.2;delete it.answers;toast('Got it — researching now');renderInbox();}
function keep(id){var it=item(id);it.status='archive';it.tag='Archived';it.substate=null;it.open=false;it.when='today';pushArchive(it.kid,it,'keep');toast('Kept · saved to your archive');renderInbox();}
function routeDoc(){toast('Doctor summary prepared · kept with this report');}
render();
</script>
</body>
</html>
