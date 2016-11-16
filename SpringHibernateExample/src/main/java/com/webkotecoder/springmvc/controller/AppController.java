package com.webkotecoder.springmvc.controller;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webkotecoder.springmvc.model.User;
import com.webkotecoder.springmvc.service.UserService;

@Controller
@RequestMapping("/")
public class AppController {
	private final int MAX_PAGES_ON_PAGINATION_BAR = 10;
	private final int MAX_ROWS_PER_PAGE = 10;
	private final String JSP_All_USERS = "allusers";
	private final String JSP_REGISTRATION_FORM = "registration";
	private final String JSP_SUCCESS_REGISTRATION = "success";
	private final String URL_REDIRECT = "redirect:";
	private final String URL_HOME = "/";
	private final String URL_ADD_NEW_USER = "/new";
	private final String URL_SEARCH_USER = "/search";
	private final String URL_EDIT_USER = "/edit-{email}-user";
	private final String URL_DELETE_USER = "/delete-{email}-user";
	@Autowired
	UserService service;

	@Autowired
	MessageSource messageSource;

	@RequestMapping(value = URL_SEARCH_USER, method = RequestMethod.GET)
	public String findUser(@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "page", required = false) Integer page, ModelMap model) {

		model.addAttribute("searchedName", name);
		List<User> users = service.findUsersByName(name);
		PagedListHolder<User> pagedListHolder = new PagedListHolder<>(users);
		pagedListHolder.setPageSize(MAX_ROWS_PER_PAGE);
		model.addAttribute("maxPages", pagedListHolder.getPageCount());

		if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
			page = 1;
		}
		model.addAttribute("page", page);
		if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
			pagedListHolder.setPage(0);
			model.addAttribute("userList", pagedListHolder.getPageList());
		} else if (page <= pagedListHolder.getPageCount()) {
			pagedListHolder.setPage(page - 1);
			model.addAttribute("userList", pagedListHolder.getPageList());
		}
		int start = (page / MAX_PAGES_ON_PAGINATION_BAR) * MAX_PAGES_ON_PAGINATION_BAR;

		model.addAttribute("start", (start == 0) ? 1 : start);

		int finish = ((start + MAX_PAGES_ON_PAGINATION_BAR) >= pagedListHolder.getPageCount())
				? pagedListHolder.getPageCount() : start + MAX_PAGES_ON_PAGINATION_BAR-1;
		model.addAttribute("finish", finish);
		return JSP_All_USERS;
	}

	/*
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = URL_ADD_NEW_USER, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		return JSP_REGISTRATION_FORM;
	}

	/*
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = URL_ADD_NEW_USER, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return JSP_REGISTRATION_FORM;
		}

		if (!service.isUserEmailUnique(user.getId(), user.getEmail())) {
			FieldError emailError = new FieldError("user", "email", messageSource.getMessage("non.unique.email",
					new String[] { user.getEmail() }, Locale.getDefault()));
			result.addError(emailError);

			return JSP_REGISTRATION_FORM;
		}

		service.saveUser(user);

		model.addAttribute("success", "User " + user.getName() + " registered successfully");
		return JSP_SUCCESS_REGISTRATION;
	}

	/*
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = URL_EDIT_USER, method = RequestMethod.GET)
	public String editUser(@PathVariable String email, ModelMap model) {
		User user = service.findUserByEmail(email);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		return JSP_REGISTRATION_FORM;
	}

	/*
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = URL_EDIT_USER, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable String email) {

		if (result.hasErrors()) {
			return JSP_REGISTRATION_FORM;
		}

		if (!service.isUserEmailUnique(user.getId(), user.getEmail())) {
			FieldError emailError = new FieldError("user", "email", messageSource.getMessage("non.unique.email",
					new String[] { user.getEmail() }, Locale.getDefault()));
			result.addError(emailError);
			return JSP_REGISTRATION_FORM;
		}

		service.updateUser(user);

		model.addAttribute("success", "User " + user.getName() + " updated successfully");
		return JSP_SUCCESS_REGISTRATION;
	}

	/*
	 * This method will delete a user by it's email value.
	 */
	@RequestMapping(value = URL_DELETE_USER, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String email) {
		service.deleteUserByEmail(email);
		return URL_REDIRECT + URL_HOME;
	}

	/*
	 * This method will list all existing users.
	 */
	@RequestMapping(value = URL_HOME)
	public String listOfUsers(@RequestParam(required = false) Integer page, ModelMap model) {

		List<User> users = service.findAllUsers();
		PagedListHolder<User> pagedListHolder = new PagedListHolder<>(users);
		pagedListHolder.setPageSize(MAX_ROWS_PER_PAGE);
		model.addAttribute("maxPages", pagedListHolder.getPageCount());

		if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
			page = 1;
		}
		model.addAttribute("page", page);
		if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
			pagedListHolder.setPage(0);
			model.addAttribute("userList", pagedListHolder.getPageList());
		} else if (page <= pagedListHolder.getPageCount()) {
			pagedListHolder.setPage(page - 1);
			model.addAttribute("userList", pagedListHolder.getPageList());
		}
		int start = (page / MAX_PAGES_ON_PAGINATION_BAR) * MAX_PAGES_ON_PAGINATION_BAR;

		model.addAttribute("start", (start == 0) ? 1 : start);
		
		int finish = ((start + MAX_PAGES_ON_PAGINATION_BAR) >= pagedListHolder.getPageCount())
				? pagedListHolder.getPageCount() : start + MAX_PAGES_ON_PAGINATION_BAR-1;
		model.addAttribute("finish", finish);
		

		return JSP_All_USERS;
	}

}
