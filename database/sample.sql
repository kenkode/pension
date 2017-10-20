-- Insert default category
INSERT INTO `category` (`cat_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Smart Phones', NULL, NULL, NULL);


-- Insert sample products
INSERT INTO `product` (`product_id`, `name`, `category`, `price`, `quantity`, `description`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'IPhone', 1, 70000.00, '6', 'Iphone 7', 0, '2017-02-03 07:16:26', '2017-02-03 06:02:55'),
(2, 'Samsung Note 7', 1, 80000.00, '10', 'Can be used as a bomb', 0, '2017-02-03 05:20:15', '2017-02-03 06:08:07'),
(3, 'Nokia Lumia', 1, 45000.00, '6', 'Nokia phone', 0, '2017-02-03 10:27:23', '2017-02-03 10:27:23'),
(4, 'Xtigi', 1, 6000.00, '4', 'Quite a phone', 0, '2017-02-03 10:38:42', '2017-02-03 10:44:55');
