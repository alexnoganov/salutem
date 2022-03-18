import datetime
import html

from django import template

register = template.Library()


@register.filter
def fi1ll(query_list):
    q_len = 0
    res = ''
    for i in range(len(query_list), len(query_list) + 5):
        if i % 5 == 0:
            q_len = i
            break
    for i in range(0, q_len):
        try:
            add = True
            for k in range(0, 5):
                if query_list[i].date.weekday() == k:
                    res += '<div class="accent-orange-gradient"><div class="time">' + query_list[i].date.strftime(
                        "%d.%m.%Y %H:%M") + '</div><div class="patient">Кондратенко Виталий Русланович</div></div>'
                    add = False
                else:
                    add = True
            print(add)
            if add:
                res += '<div></div>'
            # else:
            #     res += '<div class="accent-orange-gradient"><div class="time">' + query_list[i].date.strftime(
            #         "%d.%m.%Y %H:%M") + '</div><div class="patient">Кондратенко Виталий Русланович</div></div>'
        except IndexError:
            res += '<div></div>'
        # print(add)
    return res


# @register.filter
# def fill(query_list):
#     q_len = 0
#     res = ''
#     days = {}
#     for i in range(len(query_list), len(query_list) + 20):
#         if i % 5 == 0 and i // 5 > 3:
#             q_len = i
#             break
#     for item in query_list:
#         print(item.date.isocalendar().week)
#     week = 0
#     for i in range(0, len(query_list)):
#         days.update({week.__str__() + query_list[
#             i].date.weekday().__str__(): '<div class="accent-orange-gradient"><div class="time">' + query_list[
#             i].date.strftime(
#             "%d.%m.%Y %H:%M") + '</div><div class="patient">Кондратенко Виталий Русланович</div></div>'})
#         if query_list[i].date.weekday() == 4:
#             week += 1
#     week = 0
#     for i in range(0, q_len):
#         if i > 1:
#             if i % 5 == 0:
#                 week += 1
#         if days.get(str(week) + str(i % 5)):
#             res += days.get(str(week) + str(i % 5))
#         else:
#             res += '<div></div>'
#     return res

@register.filter
def fill(query_list):
    q_len = 0
    res = ''
    week_days = {}
    for i in range(len(query_list), len(query_list) + 20):
        if i % 5 == 0 and i // 5 > 3:
            q_len = i
            break
    for i in range(0, len(query_list)):
        week_days[query_list[i].date.isocalendar().week] = {
            0: [],
            1: [],
            2: [],
            3: [],
            4: [],
        }
    for i in range(0, len(query_list)):
        d = '<div class="accent-orange-gradient"><div class="time">' + query_list[i].date.strftime(
            "%d.%m.%Y %H:%M") + '</div><div class="patient">Кондратенко Виталий Русланович</div></div>'
        for key in week_days:
            if query_list[i].date.isocalendar().week == key:
                for k in week_days[key]:
                    if query_list[i].date.weekday() == k:
                        week_days[key][k].append(d)
                # days[key].update({str(query_list[i].date.weekday()): })
    # print({1: {123: 'asd'}})
    # for item in query_list:
    #     print(item.date.strftime("%d.%m.%Y %H:%M"))
    # for i in range(0, len(query_list)):
    #     d = '<div class="accent-orange-gradient"><div class="time">' + query_list[i].date.strftime(
    #         "%d.%m.%Y %H:%M") + '</div><div class="patient">Кондратенко Виталий Русланович</div></div>'
    #     if query_list[i].date.weekday() == 0:
    #         days[0].update({str(query_list[i].date.isocalendar().week) + str(i): d})
    #     elif query_list[i].date.weekday() == 1:
    #         days[1].update({str(query_list[i].date.isocalendar().week) + str(i): d})
    #     elif query_list[i].date.weekday() == 2:
    #         days[2].update({str(query_list[i].date.isocalendar().week) + str(i): d})
    #     elif query_list[i].date.weekday() == 3:
    #         days[3].update({str(query_list[i].date.isocalendar().week) + str(i): d})
    #     elif query_list[i].date.weekday() == 4:
    #         days[4].update({str(query_list[i].date.isocalendar().week) + str(i): d})
    print(week_days)
    # for i in range(0, len(query_list)):
    #     d.update({i: '<div class="accent-orange-gradient"><div class="time">' + query_list[i].date.strftime(
    #         "%d.%m.%Y %H:%M") + '</div><div class="patient">Кондратенко Виталий Русланович</div></div>'})
    #     days.update({str(query_list[i].date.isocalendar().week) + str(query_list[i].date.weekday()): d})
    #     print(days)
    # for i in range(0, q_len):
    #     try:
    #         if days.get(str(query_list[i].date.isocalendar().week) + str(i % 5)):
    #             res += days.get(str(query_list[i].date.isocalendar().week) + str(i % 5))
    #         else:
    #             res += '<div></div>'
    #     except IndexError:
    #         pass
    # week_days_len[query_list[i].date.isocalendar().week] = 0
    for week in week_days:
        for day in range(0, len(week_days[week])):
            # print(week_days[days][day]
            day_len = len(week_days[week][day])
            if len(week_days[week][day]) == 0:
                res += '<div></div>'
            elif len(week_days[week][day]) == 1:
                res += week_days[week][day].pop(0)
            else:
                res += '<div></div>'
            print(week_days[week][day])
            #     for i in range(0, len(week_days[days][day])):
            #         if week_days[days][day][i]:
            #             res += week_days[days][day][i]
            # print(week_days[days][day])

    # for days in week_days:
    #     i = 0
    #     while week_days[days][i]:
    #         if len(week_days[days][i]) == 0:
    #             res += '<div></div>'
    #             i += 1
    #         elif len(week_days[days][i]) == 1:
    #             res += week_days[days][i].pop(0)
    #             i += 1
    #         else:
    #             for k in range(0, len(week_days[days][i])):
    #                 if week_days[days][i][k]:
    #                     res += week_days[days][i][k]
    #             # i += 1
    #     print(week_days[days][i])
    return res
