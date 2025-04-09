# 🧾 Expense Tracker - Feature Checklist

## ✅ Core Functionality

- [x] Add Expense Transaction
- [x] Add Transfer Transaction
- [ ] Add Income Transaction
- [ ] Add Investment Transaction
- [x] Edit Existing Transaction
- [x] Delete Single Transaction
- [x] Multi-select & Batch Delete Transactions
- [x] Split Expenses (Dynamic form)
- [x] Person selection per split
- [x] Splitwise toggle per split
- [x] Default full amount as self-split
- [x] Real-time Split Summary UI
- [x] Validate Split Total = Transaction Total
- [x] Fee Amount (optional) in Transfers
- [x] Fee Source (auto-filled, overrideable)
- [x] Backend merges duplicate splits
- [x] Add Category + Need/Want Flag

---

## 💳 Fund Source Tracking

- [x] Add / List Sources
- [x] Transfer between Sources
- [x] Track Fees on Transfers
- [x] Auto copy fee source from transfer source
- [x] Destination source validation

---

## 🎨 UI/UX Enhancements

- [x] System Default Theme Support (light/dark)
- [x] Material 3 Styling
- [x] Modal Bottom Sheet for Add Action (Expense / Transfer)
- [x] Back Button cancels selection mode (`PopScope`)
- [x] Checkbox selection with counter
- [x] Themed selection tile color
- [x] Enum-based Dropdowns (clean and type-safe)
- [x] Inline validation and error handling

---

## 📊 Insights & Reporting

- [ ] Monthly summary view
- [ ] Calendar-based breakdown
- [ ] Pie chart by category
- [ ] Bar graph by source or person
- [ ] Summary cards (Total Spent, Saved, etc.)

---

## 🔍 Filtering & Tagging

- [ ] Filter by category
- [ ] Filter by source
- [ ] Filter by person
- [ ] Search transactions
- [ ] Filter by need vs want
- [ ] Mark transaction as favorite / pinned

---

## 🔄 Advanced Features

- [ ] Recurring Transactions
- [ ] Backup to file (JSON/CSV)
- [ ] Restore from file
- [ ] Export to CSV
- [ ] Source balance audit + manual adjust
- [ ] Budget limits / alerts

---

## ⚙️ Dev & Architecture

- [x] Drift with DAOs and Relations
- [x] Riverpod for reactive state
- [x] Enum serialization via `.name`
- [x] UI-safe context handling (`mounted`)
- [x] Centralized merge of splits in DAO
- [x] ORM-like mappers per screen
